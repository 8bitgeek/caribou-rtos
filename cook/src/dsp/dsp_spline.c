#include <dsp_spline.h>
#include <math.h>

#define OK		   0		/* no problems */
#define	NOMEMORY	  -1		/* no memory available for buffers */
#define EQALXES		  -2		/* two x-coordinates are equal */
#define MAXTXTLEN	  80
#define BLANK       -INFINITY

#define setfblank_c(f)  *(f)=BLANK

#define finit( fc , len ) { fc.a = malloc( ( len + 1 ) * sizeof( char ) ); fc.l = len; }

static int cubic( point_t* pt, uint32_t  n, 
                  float  yp1, float  ypn, float *y2 );

static int splint( point_t* pt, float *y2a, 
                   int n, float x, float *y );

static uint32_t blanks_y( point_t p[], uint32_t p_sz );
static void     blank_y ( point_t p[], uint32_t p_sz );

static int klo = -1;
static int khi = -1;

/**
 * @param pin[]   Array containing input x-y data points.
 *
 * @param pin_sz  Number of (XI,YI) coordinate pairs.
 *
 * @param pout[]  Array containing output x-y data points.
 *                Containing x-coordinates for which y-coordinates
 *                are to be interpolated.
 *                Containing interpolated y-coordinates.
 *                If ALL pin[].y are undefined, ALL pout[].y are set to undefined.
 *
 * @param pout_sz Number of x-coordinates for which interpolation
 *                is wanted.
 *
 * @return        spline returns error codes:
 *                >0 - number of undefined values in YI.
 *                 0 - no problems.
 *                -1 - not enough memory to create internal tables.
 *                -2 - the input array has two equal x-coordinates or
 *                     value in XO outside range of input coordinates >
 *                     interpolation problems.
 *
 * @brief      The interpolation is based on the cubic spline interpolation
 *             routines described in "Numerical recipes in C". For the interpolation
 *             data points in YI wich are undefined are skipped. Thus if undefined
 *             values are present, this routine will interpolate across them. 
 *             XI data must be in increasing order. The number of undefined values 
 *             in YI is returned.
 *
 */
int spline( point_t pin[], uint32_t pin_sz, 
            point_t pout[], uint32_t pout_sz )
{
  float     yp1;
  float     ypn;
  float     *y2;
  float     alpha;
  int       niin;  
  uint32_t  x;
  point_t*  pii   = NULL;
  uint32_t  m     = 0;
  int       error = 0;  
  uint32_t  nblank= 0;

  alpha = 1.0f;
  yp1   = 3e30f * alpha ;
  ypn   = 3e30f * alpha; 

  nblank = blanks_y( pin, pin_sz );
  niin = pin_sz - nblank;

  if ( nblank == 0 ) 
  {
     pii = &pin[0];
  }  
  else 
  if ( nblank == pin_sz ) 
  { 
    blank_y( pout, pout_sz );
  } 
  else 
  {
    pii = (point_t*)malloc( ( niin ) * sizeof( point_t ) );
    if ( pii ) 
    {
      for ( x = 0 , m = 0; ( x < pin_sz ) && ( m < niin ); x++ ) 
      {
        if ( pin[x].y != BLANK )
        { 
          point_cpy( &pii[ m++ ], &pin[ x ] );
        }
      }
    }
    else
    {
      error = NOMEMORY;
    }
  }

  if ( (y2 = (float *)malloc( ( niin ) * sizeof( float ) )) != NULL )
  {
    if ( (error = cubic(  pii , niin , yp1 , ypn , y2 )) >= 0  )
    {
      klo = -1; /* Reset ' klo' before table interpolation */
      for ( x = 0 ; x < pout_sz ; x++ ) 
      {
        error = splint( pii, y2, niin, pout[ x ].x, &pout[ x ].y ) ;
      }
    } 
  }
  else
  {
    error = NOMEMORY;
  }

  if ( nblank != 0 && pii ) 
  {
    free( pii );
  }

  if ( y2 )
  {
    free( y2  );
  }

  return errno != 0 ? error : nblank;
}

/**
 * @brief spline constructs a cubic spline given a set of x and y values, through
 *        these values.
 */
static int cubic( point_t* pt, uint32_t n, 
                    float  yp1, float  ypn, float *y2 )
{
  int   i,k;
  float p,qn,sig,un,*u;

  u=(float *)malloc((unsigned) (n-1)*sizeof(float));
  if ( u )
  {
  
    if (yp1 > 0.99e30f)
    {
      y2[0]=u[0]=0.0f;
    }
    else 
    {
      y2[0] = -0.5f;
      u[0]=(3.0f/(pt[1].x-pt[0].x))*((pt[1].y-pt[0].y)/(pt[1].x-pt[0].x)-yp1);
    }

    for (i=1;i<=n-2;i++) 
    {
      sig=(pt[i].x-pt[i-1].x)/(pt[i+1].x-pt[i-1].x);
      p=sig*y2[i-1]+2.0f;
      y2[i]=(sig-1.0f)/p;
      u[i]=(pt[i+1].y-pt[i].y)/(pt[i+1].x-pt[i].x) - (pt[i].y-pt[i-1].y)/(pt[i].x-pt[i-1].x);
      u[i]=(6.0f*u[i]/(pt[i+1].x-pt[i-1].x)-sig*u[i-1])/p;
    }
    
    if (ypn > 0.99e30f)
    {
      qn=un=0.0f;
    }
    else 
    {
      qn=0.5f;
      un=(3.0f/(pt[n-1].x-pt[n-2].x))*(ypn-(pt[n-1].y-pt[n-2].y)/(pt[n-1].x-pt[n-2].x));
    }
    
    y2[n-1]=(un-qn*u[n-2])/(qn*y2[n-2]+1.0f);
    
    for (k=n-2;k>=0;k--)
    {
      y2[k]=y2[k]*y2[k+1]+u[k];
    }
    
    free(u);
    
    return OK;
  }
  return NOMEMORY;
}

/**
 * @brief splint uses the cubic spline generated with spline to interpolate values
 *        in the XY  table.
 */
static int splint( point_t* pt, float *y2a, 
                    int n, float x, float *y )
{
  int   r = 0;
	int   k;
	float h,b,a;

  if ( klo < 0 )
  {
  	klo=0;
 	  khi=n-1;
  } 
  else 
  {
    if ( x < pt[klo].x ) klo=0;
    if ( x > pt[khi].x ) khi=n-1;
  }
	
  while (khi-klo > 1) 
  {
		k=(khi+klo) >> 1;
		if (pt[k].x > x) khi=k;
		else klo=k;
	}
	
  h=pt[khi].x-pt[klo].x;

	if (h == 0.0f) 
  {
    *y = BLANK;
    r = EQALXES;
  } 
  else 
  {
    a=(pt[khi].x-x)/h;
    b=(x-pt[klo].x)/h;
    *y=a*pt[klo].y+b*pt[khi].y+( (a*a*a-a)*y2a[klo]+(b*b*b-b)*y2a[khi] ) * (h*h) / 6.0f;
  }

	return r;
}

/**
 * @brief count blanks_y in the y
 */
static uint32_t blanks_y( point_t p[], uint32_t p_sz )
{
  uint32_t nblank;
  for ( uint32_t x = 0; x < p_sz; x++ )
  {
    if ( p[ x ].y == BLANK ) 
    {
      ++nblank;
    }
  }
  return nblank;  
}

static void blank_y( point_t p[], uint32_t p_sz )
{
  for ( uint32_t x = 0; x < p_sz; x++ ) 
  {
    p[ x ].y = BLANK;
  }
}
