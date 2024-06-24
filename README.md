# README

This is the repositery for the group project of the PD course (Processor Design) during the spring semester of year 2023/2024 at FIB institution. 

The global aim of the project is to test a the tool "Panda-Bambu",  a framework for the High-Level Synthesis which take behavioral description of the specification, written in C/C++ language, and generates the HDL description of the corresponding RTL implementation.
We will test in on the benchmark project named "GPU4S".

You can find links to the framework and GPU4S project at the end of the readme.

## Repo organisation

Here below a few words to help you understand the folder organisation and how to take it in hand

### Main folders

Repository has two main folders:

- bambu_examples: examples taken from PandA-bambu repository for comparison
- PD_project: benches taken from GPU4S repository with C/CPP functions 
implementation on which we studied bambu framework

### Project organisation:

Each of the folder that you can find in "PD_project" correspond to a benchmark implementation and bambu synthesis of it.

- The bambu workshop is in the "bambu" folder for each bench, you can find the executable "bambu.sh" used to launch bambu synthesis and keep track of used options. You also can fin a folder named like "mm_synth_XSIM" that contain bambu synthesis and workflow

- The CPP functions synthesized in this project is usually contained in a folder "cpu_functions", for some of them it is also be in the main folder. You can fin the path of the synthesized file in the executable "bambu.sh" as one of the first option passed to bambu

## Launching

### launch bambu synthesis

If you meet the requirements (explained below) you can launch bambu synthesis by moving into "bambu" folder into any benchmark projects and just execute "bambu.sh", for example :

```
$ cd softmax_bench/bambu
$ ./bambu.sh
```

You can play with option passed to bambu inside the bambu.sh executable to see how it impact the result.

### Requirements & installation:

You need to have installed bambu framework and Xilinx vivado, for use it worked only on **Ubuntu 18.04** on WSL (Windows Subsystem for Linux). Below you can find the requirements to launch the executable

- You need to have bambu installed and added to your PATH 

- You need to install the required packages in bambu website (link : https://panda.deib.polimi.it/?page_id=88 )

- You also need to have xilinx installed in the folder "/opt/Xilinx" (be carefull it is not the proposed folder by Xilinx during the installation process)

You can follow these steps that are the one which worked for us to install it (on windows):

1. enable WSL and install Ubuntu18.04 on it(you can find many explanation on internet)

2. download bambu appimage on the github repository inside the /opt/ folder (you can find the link on https://panda.deib.polimi.it/?page_id=81)

    ```
    $chown -R <username.usergroup> /opt
    $cd /opt/
    $sudo wget https://release.bambuhls.eu/bambu-2023.1.AppImage
    $chmod +x bambu-***.AppImage
    ```

3. add an executable to the PATH using vim and launching the appimage

    ```
    $ sudo vim /usr/local/bin/bambu
    ```

    The executable file need to have only these two lines:

    ```
    #!/bin/bash
    /opt/bambu-2023.1.AppImage "$@"
    ```

    Make it executable :

    ```
    $sudo chmod+x /opt/local/bin/bambu
    ```

    now you have the appimage add to your path you can call the version to test if it works well:

    ```
    $bambu --version
    ```

4. install Xilinx from the website and be carefull to change installation folder to ```/opt/Xilinx``` (link: https://www.xilinx.com/support/download.html)

## Changes from GPU4S project

For some of the benches, the CPP function was using mathematical function from  `cmath` library, unfortunately bambu couldn't handle it (or we didn't find how to do it), thus we implemented approximation function for exp / sin / log / pow function based on Taylor's serie decomposition.

They are implemented directtly inside the "cpu_functions.cpp" files when needed and are called sin20 / exp20 / log20 / pow20 because they approximate the function up to the 20th term.

## Links

Drive folder with analysis : https://drive.google.com/drive/folders/1MNWOZn1yHtZia8zN1w23LO-vgAu3y2ZA?usp=sharing

GPU4S repo : https://github.com/OBPMark/GPU4S_Bench.git

GPU4S paper : https://www.ac.upc.edu/app/research-reports/public/html/research_center_index-CAP-2019,en.html

PandA-Bambu repo: https://github.com/ferrandi/PandA-bambu.git

PandA-Bambu website: https://panda.deib.polimi.it/?page_id=31

## Project participants

- Gaétan Jacquemin
- Paul Evers
