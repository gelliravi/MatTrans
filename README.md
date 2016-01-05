============================================================================
MATTRANS - A MATLAB(R) Power System Transient Stability Simulation Package
============================================================================

Version:    1.0

Authors:    Gelli Ravikumar <gravikumar@iitb.ac.in>
            
Created:    05 Sep 2015

Updated:    05 Jan 2016

$Id: README 05 Sep 2015 Gelli $

Copyright (c) 2015-2016 by Gelli
See http://tinyurl.com/gelliPapers for more info.

Copying and distribution of this file, with or without modification,
are permitted in any medium without royalty provided the copyright
notice and this notice are preserved. This file is offered as-is,
without any warranty.

--------------
 INTRODUCTION
--------------

MATTRANS is a package of MATLAB(R) M-files for solving transient stability. It is intended as a simulation tool for
researchers and educators that is easy to use and modify. MATTRANS
is designed to give the best performance possible while keeping the code
simple to understand and modify. It was initially developed in 2008 and the files can be found at: <https://www.ee.iitb.ac.in/~anil/download/Transient_Stability_Programs/>. The MATTRANS has been developed on the basis of these files and tried to follow the DRY (Dont Repeat Yourself) coding principle as much as possible.
The MATTRANS project has been initiated for the research project of "A comparative assessment of PMU Data based Catastrophic Indicators for Power System Stability Assessment". Currently, the paper is under the review process.
The MATPOWER (<http://www.pserc.cornell.edu/matpower/>) coding design principles have been inspired to develop the MATTRANS, which uses MATPOWER package to execute the steady-state power flow.
MATTRANS can be downloaded from the <https://github.com/gelliravi/MatTrans/archive/master.zip>


--------------
 TERMS OF USE
--------------

Please see the LICENSE file for the details. But here is the summary:

- MATTRANS is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY.

- While not required by the terms of the license, we do request the MATTRANS to cite as:

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
    - MATLAB(R) version 15 or later (available from The MathWorks, Inc.
      http://www.mathworks.com/). The MATTRANS is tested on MATLAB 2015b, hope it may also work with older versions. For any concerns, please  contact: <gravikumar@iitb.ac.in>

    - MATPOWER (<http://www.pserc.cornell.edu/matpower/>), which is needed to execute the steady-state power flow.

Installation
------------
1.  Download the MATTRANS from: <https://github.com/gelliravi/MatTrans/archive/master.zip>

2.  Unzip the downloaded file. Move the resulting MATTRANS directory
    to the location of your choice. These files should not need to be
    modified, so it is recommended that they be kept separate from your
    own code. Let $MATTRANS denote the path to this directory.

3.  Add the following directories to your MATLAB path:
      $MATTRANS   - all MATTRANS functions
      $MATTRANS/src - core MATTRANS files


Running MATPOWER
----------------
To run a simple Newton power flow on the 9-bus system specified in the
file case9.m, with the default algorithm options, at the MATLAB prompt,
type:

    runts(data.case10, data.case10dd)
    % all case files are placed in the data folder. Hence, it is needed to use data prefix to find the folder.
    % data.case10 - It is a .m file, which has steady-state network data and the format is same as MATPOWER case format.
	% data.case10dd - It is a .m file, which has dynamic-data of the above network and the format is defined as MATTRANS casedd format.

For additional info:
   - help runts
   - Proper documentation of the MATTRANS will be provided as early as possible. Meanwhile, if any assisstance needed please don't hesitate to contact: <gravikumar@iitb.ac.in>

-----------------------------
 WHAT'S IN VERSION 1.0
-----------------------------

Below is a summary of the 1.0 of MATTRANS. See the
CHANGES file in the docs directory for all the gory details.

* New features:
  - Execution of Transient stability program, which is use both coding and simulation environment of MATLAB.


---------------
 DOCUMENTATION
---------------

The detailed documentation of the MATTRANS will be added as early as possible.
However, MATLAB's 'help' command can be used for the functionality of MATTRANS codes.

----------------
 ACKNOWLEDGEMENT
----------------

 - The thanks are due to the base version developers of the transient stability program available in its native format at: <https://www.ee.iitb.ac.in/~anil/download/Transient_Stability_Programs/>

 - The thanks are due to the MATPOWER developers and all the users of MATPOWER community.

 - The thanks are due to my supervisor Prof. S. A. Khaparde, Dept. of Electrical and Electronics Engineering, IIT Bombay, and the host institute: IIT Bombay.



