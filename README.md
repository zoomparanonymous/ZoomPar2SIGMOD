# ZoomPar2: Fast and Accurate PARAFAC2 Decomposition for Answering Time Range Queries on Irregular Tensors
This is a code for "ZoomPar2: Fast and Accurate PARAFAC2 Decomposition for Answering Time Range Queries on Irregular Tensors", submitted to SIGMOD 2024.

## Code Information
All codes are written by MATLAB R2020b.
This repository contains the code for ZoomPar2, a fast and accurate PARAFAC2 decomposition method for answering time range queries on irregular tensors

- The code of ZoomPar2 is in `src` directory.

## Library
For running our method, we use the following library.
If you use our method, please refer to the following, too.
We use the following libraries:
 - `Tensor Toolbox v3.0`
 > * Reference: B. W. Bader, T. G. Kolda et al., “Matlab tensor toolbox version 3.0-dev,” Available online, Oct. 2017. [Online]. Available: <https://www.tensortoolbox.org>
 - `SPARTan`
 > * Reference: Perros, I., Papalexakis, E. E., Wang, F., Vuduc, R., Searles, E., Thompson, M., & Sun, J. SPARTan: Scalable PARAFAC2 for large & sparse data. KDD, 2017.

## Demo
We provide demo scripts for running ZoomPar2 on a synthetic tensor and a real-world tensor.

### How to run for sample data
We provide demo scripts for generating synthetic tensor data and running ZoomPar2.
First, you run MATLAB, and type the following commands in MATLAB.

Before you run our proposed method, you should add paths into MATLAB environment. Please type the following command in MATLAB:
    ```
    run addPaths.m
    ```

Then, type the following command to run the demo for the synthetic data:
    ```
    run demo_synthetic.m
    ```

### How to run for real-world data
Among real-world datasets used in our paper, we provide demo scripts for US Stock data and KR Stock data.
We provide the demo scripts for ZoomPar2.
You first download the US Stock data and KR Stock data with the following links:
[US Stock data](https://drive.google.com/file/d/1-1KkGo2HRhRK8u8aHRXA3iYOGjgKFrVd/view?usp=sharing) and
[KR Stock data](https://drive.google.com/file/d/1n5Z7TI9xPNg_ktNGxdWcxfTMV5fDC6-m/view?usp=sharing)

Then, you extract the zip file and move the extracted folder to `data` folder.
If data cannot be loaded, check the path and change the path in the script.
(Note that You can download other (raw) data from the links ([Video](https://github.com/OsmanMalik/tucker-tensorsketch), [Boat](http://changedetection.net/), [Traffic](https://github.com/florinsch/BigTrafficData)))

You run MATLAB, and type the following commands in MATLAB.

You should add paths into MATLAB environment before you run our proposed method. Please type the following command in MATLAB:
    ```
    run addPaths.m
    ```

We provide demo scripts to run our method ZoomPar2 for real-world datasets.
Then, type the following command to run the demo:
    `run demo_us.m` or `run demo_kr.m`
