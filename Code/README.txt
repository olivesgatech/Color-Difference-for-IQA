%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
README 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Title: Image Quality Assesment and Color Difference

Authors: Dogancan Temel and Ghassan AlRegib

Affiliation: Georgia Institute of Technology
Center for Signal and Information Processing (CSIP)

Documented by: DCT

Date: 06/15/14
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

1- Download database Release 2 from : http://live.ece.utexas.edu/research/quality/subjective.htm
2- Locate dowloaded "databaserelease2" folder in the same directory with the codes
3-Add "COL_DIST" and "FastEMD" inside COL_DIST to your matlab path
4-To configure COL_DIST, run demo_COL_DIST
5-To compile FastEMD, run compile_FastEMD under FastEMD directory
6-Follow the steps, explained below, to regenerate GlobalSIP paper

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Figure 3. Scatter Plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-run mainLive_v13.m
-run statsv8.m
-run nonLinRegV3.m
-->	output images (pop put):
	Figure 1:	Fig. 3 (a)
	Figure 2:	Fig. 3 (c)
	Figure 3:	Fig. 3 (b)
	Figure 4:	Fig. 3 (d)
	Figure 5:	Fig. 3 (e)	
	Figure 5:	Fig. 3 (e)	
	Figure 6:	Fig. 3 (f)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
Table 1. Nonlinear regression coefficients
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-run mainLive_v13.m
-run statsv8.m
-run nonLinRegV2.m

-in the command prompt, type model names* to obtain estiamted coefficients
	model names:
				nlmColDist:	Table I, row 6
				nlmCwssim:	Table I, row 5
				nlmMsssim:	Table I, row 4
				nlmSsim:	Table I, row 3
				nlmPsnr:	Table I, row 1

-run mainLiveCQAV4_ses5.m (set sc=0.05)
-run statsCQA.m
-in the command prompt, type "nlmColDist":	Table I, row 2
	model names:
				nlmColDist
				nlmCwssim
				nlmMsssim
				nlmPsnr
				nlmSsim				
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%				
Table 2. Objecive quality metric results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-run mainLive_v13.m
-run statsv8.m
-run nonLinRegV2.m
-->command window:
		corrMat,row1: Table II, Linear CC, row 1 
		corrMat,row2: Table II, Linear CC, row 3
		corrMat,row3: Table II, Linear CC, row 4
		corrMat,row4: Table II, Linear CC, row 5
		corrMat,row5: Table II, Linear CC, row 6

		
		rmseMat,row1: Table II, Linear CC, row 1 
		rmseMat,row2: Table II, Linear CC, row 3
		rmseMat,row3: Table II, Linear CC, row 4
		rmseMat,row4: Table II, Linear CC, row 5
		rmseMat,row5: Table II, Linear CC, row 6

-run mainLiveCQAV4_ses5.m (set sc=0.05)
-run statsCQA.m
-->command window:
					rmseMat: Table II, RMSE, row II
					corrMat: Table II, Linear CC, row II
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Figure 4. Reference image, distorted image and corresponding distortion maps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-Open mainMaps.m
-set sc=005
-comment out block 1
-run mainMaps.m 
-->	output images (pdf + pop put):
	original(Figure 1): 	Fig. 4(a)
	distorted(Figure 2):  Fig. 4 b)
	ssimMap(Figure 3):	Fig. 4(c)
	pcdmMap(Figure 4):	Fig. 4(d)
-set sc=0.50
-run mainMaps.m
--> output images:
	pcdmMap:	Fig. 4(e)
-set sc=1.00
-run mainMaps.m
--> output images (pdf + pop out):
	pcdmMap:	Fig. 4(f)
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Figure 5. Intensity and chroma distortion with corresponding distortion maps 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-Open mainMaps.m
-set sc=0.05
-only comment out block 2
-run mainMaps.m
-->	output images (pdf + pop put):
	original(Figure 1):  ~
	distorted(Figure 2):  Fig. 4 (b)
	ssimMap (Figure 3):	Fig. 4(d)
	pcdmMap (Figure 4):	Fig. 4(f)
-only comment out block 3
-run mainMaps.m
-->	output images (pdf + pop put):
	original(Figure 1):  ~
	distorted(Figure 2):  Fig. 4 {a)
	ssimMap (Figure 3):	Fig. 4(c)
	pcdmMap (Figure 4):	Fig. 4(e)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Table 3. PCDM under varying sampling rate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-open mainMaps.m
-set sc=0.05
-only commment out block 1
-click "run and time" for mainMaps.m
-->output
	command window:									 Table III, column2, row 1
	profiler:function name:COL_DIST,total time:		 Table III, column3, row 1 
-set sc=0.5
-click "run and time" for mainMaps.m
-->output
	command window:									 Table III, column2, row 2
	profiler:function name:COL_DIST,total time:		 Table III, column3, row 2 
-set sc=1.0
-click "run and time" for mainMaps.m
-->output
	command window:									 Table III, column2, row 3
	profiler:function name:COL_DIST,total time:		 Table III, column3, row 3 



