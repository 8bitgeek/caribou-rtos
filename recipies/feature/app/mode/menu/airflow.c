#include <ui/gu8/gu8.h>

#include <app.h>
#include <mode/menu.h>
#include <mode/menu/airflow.h>

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Air flow setup
 **
 **/

static gu8_choice_t airflow_setup_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TRANSDUCER } }, "1A",
    //.drill = menu_drill_context, .drill_arg32 = MENU_TBD_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TRANSDUCER } }, "1B",
    //.drill = menu_drill_context, .drill_arg32 = MENU_TBD_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _DISTANCE } }, "",
    .drill = menu_drill_context,
    .drill_arg32 = MENU_AIRFLOW1_DISTANCE_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _DISPLAY } }, "",
    //.drill = menu_drill_context, .drill_arg32 = MENU_TBD_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _LABEL } }, "",
    //.drill = menu_drill_context, .drill_arg32 = MENU_TBD_CONTEXT_ID,
  },
};

gu8_chooser_t airflow_setup_chooser = {
  .type = GU8_CHOOSER_NONE,
  .size = 5,
  .choices = airflow_setup_choices,
};

/*
 * synopsis:	Distance
 */

static gu8_choice_t airflow_distance_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _BASELINE } }, "",
    .drill = menu_drill_context,
    .drill_arg32 = MENU_AIRFLOW1_BASELINE_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _FACE_TO_FACE } }, "",
    .drill = menu_drill_context,
    .drill_arg32 = MENU_AIRFLOW1_FACETOFACE_CONTEXT_ID,
  },
};

gu8_chooser_t airflow_distance_chooser = {
  .type = GU8_CHOOSER_NONE,
  .size = 2,
  .choices = airflow_distance_choices,
};

#define _DISTANCE_MINIMUM 0.0f

extern ui_dimension_t length_dimension;

/* 
 * synopsis:	Baseline
 */

static float airflow1_baseline = _DISTANCE_MINIMUM;

static float get_airflow1_baseline(void) {
  return airflow1_baseline;
};

static void set_airflow1_baseline(float value) {
  airflow1_baseline = value;
};

ui_quantity_t airflow1_baseline_quantity = {
  .dimension	= &length_dimension,
  .maximum	= 20.0f,
  .minimum	= _DISTANCE_MINIMUM,
  .get		= get_airflow1_baseline,
  .set		= set_airflow1_baseline,
};

/* 
 * synopsis:	Face-to-face
 */

static float airflow1_facetoface = _DISTANCE_MINIMUM;

static float get_airflow1_facetoface(void) {
  return airflow1_facetoface;
};

static void set_airflow1_facetoface(float value) {
  airflow1_facetoface = value;
};

ui_quantity_t airflow1_facetoface_quantity = {
  .dimension	= &length_dimension,
  .maximum	= 20.0f,
  .minimum	= _DISTANCE_MINIMUM,
  .get		= get_airflow1_facetoface,
  .set		= set_airflow1_facetoface,
};
