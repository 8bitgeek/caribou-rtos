# CARIBOU-RTOS

## NOTICE - THIS REPOSITORY HAS MOVED
## THE ACTIVE REPOSITORY IS HERE:  https://bitbucket.org/8bitgeek/caribou-rtos

CARIBOU RTOS is a so called "Real Time" Preemtive Threaded Scheduler and collection of support services for ARM 
and RISC-V microcontrollers.

A tribute to Motorola MC68HC11 BUFFALO (Bit User Fast Friendly Aid to Logical Operation).

CARIBOU: Canadian Aid to Real-time Invested Bit Oriented Users

CARIBOU API Documentation [www.8bitgeek.net](https://www.8bitgeek.net)

---
# Using [cook](https://github.com/8bitgeek/cook)
```
# cook --help

cook <switches> [feature]

--archive            Archive workstation settings
--clean       | -c   Clean current project/target/feature
--clone              [target] Clone new target from current target
--debug       | -d   Build for debugging and launch gdb
--environment | -e   List environment variables
--examine     | -x   Examine build steps (requires 'remake')
--features    | -F   List all features
--flash       | -f   Flash the target
--help        | -?   Produce this help text
--project     | -p   [project-dir]
--rebuild     | -R   Clean and Build
--release     | -r   Build for release
--remove             [target] Remove an existing target
--restore            [archive] Restore workstation settings
--serials     | -S   List serial numbers (export HLA_SERIAL=) 
--state       | -s   Produce listing of current state
--target      | -t   [target]
--targets     | -G   List all targets
--threads     | -T   [count] Compiler Threads
--verbose     | -v   Verbose Output
--version     | -V   Display version information
```
# Setup
```
# cd recipies
# cook --project `pwd`
```
# Examples
```
# cook --target nucleo-f091 ui/blinky --flash
``` 
