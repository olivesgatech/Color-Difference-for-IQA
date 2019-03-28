# Color-Difference-for-IQA
Code for paper - D. Temel and G. AlRegib, "Image quality assessment and color difference," 2014 IEEE Global Conference on Signal and Information Processing (GlobalSIP), Atlanta, GA, 2014, pp. 970-974.

<p align="center">
  <img src=/Images/color_difference.PNG/>
</p> 

### Paper
arXiv: https://arxiv.org/abs/1811.09301

IEEE: https://ieeexplore.ieee.org/document/7032265

This is a brief explanation and demonstration of using color difference equations for image quality assessment.

### Citation
If you find our paper and repository useful, please consider citing our paper:  
```
@INPROCEEDINGS{7032265, 
author={D. {Temel} and G. {AlRegib}}, 
booktitle={2014 IEEE Global Conference on Signal and Information Processing (GlobalSIP)}, 
title={Image quality assessment and color difference}, 
year={2014}, 
pages={970-974}, 
doi={10.1109/GlobalSIP.2014.7032265}, 
ISSN={}, 
month={Dec},}

```

### Abstract 
An average healthy person does not perceive the world in just black and white. Moreover, the perceived world is not composed of pixels and through vision humans perceive structures. However, the acquisition and display systems discretize the world. Therefore, we need to consider pixels, structures and colors to model the quality of experience. Quality assessment methods use the pixel-wise and structural metrics whereas color science approaches use the patch-based color differences. In this work, we combine these approaches by extending CIEDE2000 formula with perceptual color difference to assess image quality. We examine how perceptual color difference-based metric (PCDM) performs compared to PSNR, CIEDE2000, SSIM, MS-SSIM and CW-SSIM on the LIVE database. In terms of linear correlation, PCDM obtains compatible results under white noise (97.9%), Jpeg (95.9%) and Jp2k (95.6%) with an overall correlation of 92.7%. We also show that PCDM captures color-based artifacts that can not be captured by structure-based metrics.

### Keywords
color-difference, perceptual quality, objective quality metrics, color artifacts

### Code
1. Download database Release 2 from : http://live.ece.utexas.edu/research/quality/subjective.htm
2. Locate dowloaded "databaserelease2" folder in the same directory with the codes
3. Add "COL_DIST" and "FastEMD" inside COL_DIST to your matlab path
4. To configure COL_DIST, run demo_COL_DIST
5. To compile FastEMD, run compile_FastEMD under FastEMD directory
6. Follow the steps, explained below, to regenerate GlobalSIP paper

#### Scatter Plots
* run mainLive_v13.m
* run statsv8.m
* run nonLinRegV3.m
* Output images (pop put): 	Figure 1:	Fig. 3 (a), 	Figure 2:	Fig. 3 (c), Figure 3:	Fig. 3 (b), 	Figure 4:	Fig. 3 (d), 	Figure 5:	Fig. 3 (e), Figure 5:	Fig. 3 (e),	Figure 6:	Fig. 3 (f)

#### Benchmark Table
* run mainLive_v13.m
* run statsv8.m
* run nonLinRegV2.m -> corrMat row 1-5: Table row 1,3,4,5,6, and rmseMat row 1-5: Table row 1,3,4,5,6, and  
* run mainLiveCQAV4_ses5.m (set sc=0.05)
* run statsCQA.m ->	rmseMat: Table II, RMSE, row II amd corrMat: Table II, Linear CC, row II
#### Figure 4
* Open mainMaps.m
* set sc=005
* comment out block 1
* run mainMaps.m ->	original(Figure 1):Fig. 4(a), distorted(Figure 2): Fig. 4(b),	ssimMap(Figure 3):Fig. 4(c), pcdmMap(Figure 4): Fig.4(d)
* set sc=0.50 and run mainMaps.m -> pcdmMap:	Fig. 4(e)
* set sc=1.00 and run mainMaps.m -> pcdmMap:	Fig. 4(f)
#### Figure 5
* Open mainMaps.m, set sc=0.05, only comment out block 2, run mainMaps.m ->	original(Figure 1):  ~,	distorted(Figure 2):  Fig. 4 (b)	ssimMap (Figure 3):	Fig. 4(d), 	pcdmMap (Figure 4):	Fig. 4(f)
* only comment out block 3 and run mainMaps.m - original(Figure 1):  ~,	distorted(Figure 2):  Fig. 4 {a),	ssimMap (Figure 3):	Fig. 4(c),	pcdmMap (Figure 4):	Fig. 4(e)
#### Table 2
* open mainMaps.m, set sc=0.05, only commment out block 1, click "run and time" for mainMaps.m -> Table II, column2, row 1 and profiler:function name:COL_DIST,total time:	Table II, column3, row 1 
* set sc=0.5, click "run and time" for mainMaps.m -> Table II, column2, row 2 and	profiler:function name:COL_DIST,total time:	Table II, column3, row 2 
* set sc=1.0, click "run and time" for mainMaps.m -> Table II, column2, row 3 and 	profiler:function name:COL_DIST,total time: Table II, column3, row 3 


### Contact:

Ghassan AlRegib:  alregib@gatech.edu, https://ghassanalregib.com/, 

Dogancan Temel: dcantemel@gmail.com, http://cantemel.com/


