How to use pyo on the BeagleBone Black with the Bela cape
=========================================================

This tutorial has been tested with a board flashed with the 
Bela image _v1.0.0_ following the official Bela website instructions
https://learn.bela.io/get-started-guide/bela-gem-get-started/
on March 10 2026.

Step 1 - Clone or download the needed repos from github
-------------------------------------------------------

SSH into your board with:
ssh root@192.168.6.2 (or 192.168.7.2, depending on your host computer system)
You will need two repos to run pyo projects with Bela platform.

- Bela: Core code and mandatory stuff to communicate with the board.
  (most likely all this stuff is already installed on your board, so you don't need to clone this)

    https://github.com/BelaPlatform/Bela

- Pyo-bela: Interface pyo/bela, pre-compiled binaries and project template.

    https://github.com/alexdrymonitis/pyo-bela/

Clone the Pyo-bela repository on your Bela board with:

    git clone https://github.com/alexdrymonitis/pyo-bela.git

The next steps assumes that the Pyo-bela repository is in /root/Bela 
and that the board is plugged to the host computer with a usb cable.

Step 2 - Install pyo binaries on the board
------------------------------------------

To download and install the latest pyo binaries on the board, run the 
script _install\_pyo\_on\_board.sh_ from pyo-bela sources (or follow
instructions on the [release page](https://github.com/alexdrymonitis/pyo-bela/releases)):

    cd pyo-bela
    ./install_pyo_on_board.sh

Step 3 - Prepare the host for managing a pyo-bela project
-----------------------------------------------------------

Copy the pyo-bela/build_pyo.sh script to Bela/scripts folder and make it executable:

    cp build_pyo.sh ../scripts
    chmod +x ../scripts/build_pyo.sh

At this point, if you never update the board (i.e. you just flashed your sd card), you
should call the script update_board to copy the latest framework from Bela to your board:

    cd ../scripts
    ./update_board

Step 4 - Compile and run a pyo-bela project
-------------------------------------------

From Bela/scripts folder, compile and run any of the examples in the 
pyo-bela/examples folder. The first argument to the build_pyo.sh script is 
the python file to execute (the project will have the same name as this file, 
without ".py"). The second argument is the path of the pyo-bela/common folder,
which contain all needed files to run a bela project.

    ./build_pyo.sh ../../pyo-bela/examples/music-box.py ../../pyo-bela/common

The second argument can be ommited if an environment variable called PYO_BELA_COMMON
is set to point to the location of pyo-bela/common folder.

    export PYO_BELA_COMMON=/path/to/pyo-bela/common
    ./build_pyo.sh ../../pyo-bela/examples/music-box.py

Documentation
=============

For a complete description of functions that can be used to communicate 
with the pyo embedded processes, see documentation comments in the file 
common/PyoClass.cpp.

(c) 2026 - belangeo

