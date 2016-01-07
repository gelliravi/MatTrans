===================================================================================
MATTRANS - A MATLAB(R)/Simulink Power System Transient Stability Simulation Package
===================================================================================

Version:    1.0

Authors:    Gelli Ravikumar (<gravikumar@iitb.ac.in>)
            
Created:    05 Sep 2015

Updated:    05 Jan 2016

$Id: README 05 Sep 2015 Gelli $

Copyright (c) 2015-2016 by IIT Bombay (<http://www.iitb.ac.in/>). See http://tinyurl.com/gelliPapers for more info. of author.

Copying and distribution of this file, with or without modification,
are permitted in any medium without royalty provided the copyright
notice and this notice are preserved. This file is offered as-is,
without any warranty.

--------------
 INTRODUCTION
--------------

MATTRANS is a package of MATLAB(R)/Simulink (M-files and .mdl files) for solving transient stability. It is intended as a simulation tool for
researchers and educators that is easy to use and modify. MATTRANS
is designed to give the best performance possible while keeping the code
simple to understand and modify. It was initially developed in 2008 and the files can be found at: <https://www.ee.iitb.ac.in/~anil/download/Transient_Stability_Programs/>. The MATTRANS has been developed on the basis of these files and tried to follow the DRY (Dont Repeat Yourself) coding principle as much as possible.
The MATTRANS project has been initiated for the research project of "A comparative assessment of PMU Data based Catastrophic Indicators for Power System Stability Assessment". Currently, the paper is under the review process.
The MATPOWER (<http://www.pserc.cornell.edu/matpower/>) coding design principles has been inspired to develop the MATTRANS, which inherently uses MATPOWER package to execute the steady-state power flow.
MATTRANS can be downloaded from the <https://github.com/gelliravi/MatTrans/archive/master.zip>


--------------
 TERMS OF USE
--------------

Please see the LICENSE file for the details. But here is the summary:

- MATTRANS is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY.

- While not required by the terms of the license, we do request that
publications derived from the use of MATTRANS explicitly acknowledge
that fact by citing as:

        ------- cite.bib file ------
        @misc{ref:link:gelliMatTrans,
        author = {Gelli Ravikumar},
        title = "{MATTRANS: A MATLAB Power System Transient stability Simulation Package}",
        url="{https://github.com/gelliravi/MatTrans}", 
        month = {Jan},
        year = {2016},
        }
        ------- EOL: cite.bib file ------

-----------------
 GETTING STARTED
-----------------

System Requirements
-------------------

- MATLAB(R) version 15 or later (available from The MathWorks, Inc. (http://www.mathworks.com/). The MATTRANS is tested on MATLAB R2015b (Simulink 8.6). However, various compatible formats of the Simulink models for the main transientStability.mdl have been exported. The codes automatically detects your Matlab(R)/Simulink version and automatically uses the concerned Simulink model file. Hope this resolves the crucial hectic of version compatibility problems. For any concerns, please  contact: <gravikumar@iitb.ac.in>.

- MATPOWER (<http://www.pserc.cornell.edu/matpower/>), which is needed to execute the steady-state power flow.

Installation
------------
1.  Download the MATTRANS from: <https://github.com/gelliravi/MatTrans/archive/master.zip>

2.  Unzip the downloaded file. Move the resulting MATTRANS directory
    to the location of your choice. These files should not need to be
    modified, so it is recommended that they be kept separate from your
    own code. Let $MATTRANS denote the path to this directory.

3.  Add the following directories to your MATLAB path:

    - $MATTRANS   - all MATTRANS functions
    - $MATTRANS/src - core MATTRANS files


Running MATTRANS
----------------
To run a simple transient stability on the 4 machine 10-bus system specified in the
file case10.m (steady-state data) and case10dd.m (dynamic data), with the default algorithm options, at the MATLAB prompt,
type:

    Example 1:
    runts(data.case10, data.case10dd)
    % all case files are placed in the data folder. Hence, it is needed to use data prefix to find the folder.
    % data.case10 - It is a .m file, which has steady-state network data and the format is same as MATPOWER 
    case format.
    % data.case10dd - It is a .m file, which has dynamic-data of the above network and the format is defined 
    as MATTRANS casedd format.
    % While execution it prompts the user to enter some inputs, which are:
        If NO action to be taken, PRESS ENTER for every prompt. Or else the following values can be tried.
        Fault initiation time (s), Tfault= 0.5
        Fault Duration,(s) Tclear= 0.1
        Faulted Bus: 9
        Line(s) to be tripped, [ , ]= 9
    
    Example 2:
    runts(data.case145, data.case145dd)
    % While execution it prompts the user to enter some inputs, which are:
        If NO action to be taken, PRESS ENTER for every prompt. Or else the following values can be tried.
        Fault initiation time (s), Tfault= 0.5
        Fault Duration,(s) Tclear= 0.1
        Faulted Bus: 7
        Line(s) to be tripped, [ , ]= 16    
        

For additional info:
   - help runts
   - Proper documentation of the MATTRANS will be provided as early as possible. Meanwhile, if any assisstance needed please don't hesitate to contact: <gravikumar@iitb.ac.in>

-----------------------------
 WHAT'S IN VERSION 1.0
-----------------------------

Below is a summary of the 1.0 of MATTRANS. See the
CHANGES file in the docs directory for all the gory details.

* New features:
  - Execution of Transient stability program, which uses both coding and simulation environment of MATLAB.


---------------
 DOCUMENTATION
---------------

The detailed documentation of the MATTRANS will be added as early as possible.
However, MATLAB's 'help' command can be used for the functionality of MATTRANS codes.

----------------
 ACKNOWLEDGEMENT
----------------

 - The thanks are due to the base version developers of the transient stability program that is available in its native format at: <https://www.ee.iitb.ac.in/~anil/download/Transient_Stability_Programs/>

 - The thanks are due to the MATPOWER developers and all the users of MATPOWER community.

 - The thanks are due to my supervisor Prof. S. A. Khaparde, Dept. of Electrical and Electronics Engineering, IIT Bombay, and the host institute: IIT Bombay.



