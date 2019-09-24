InTime Basic Installation
=========================

The *InTime Basic* edition runs on a single computer with the latest
strategy generation database. This edition does **not** require an
InTime Server to be running, so an InTime license file must be present
on the same machine. For *InTime Group* and *InTime Enterprise*
editions, please see the *InTime Group/Enterprise Installation* guide.

!!! tip
    To install the *InTime Cloud* edition, follow the installation
instructions for the *InTime Basic* edition. After installation a local
license *is not required* in order to submit your designs to the
*Plunify Cloud*.


After performing the steps below, please configure your environment as
described in the InTime Configuration Guide.

Operating System (OS)
---------------------

-   64-bit architectures only
-   Windows / Ubuntu 12.04 and above / RedHat Enterprise 5 and above /
    compatible
-   Other versions are supported upon request.

### Linux Installation

Please download the Linux installer:
`intime_v<InTime version>_64bit_linux.sh`

Next, proceed to install the software.

Open a command-line terminal.

Create the folder to install InTime in. :

    (Example) $ mkdir -p ~/plunify/intime

Navigate to the installation folder. :

    (Example) $ cd ~/plunify/intime

Run the installer script. :

    (Example) ~/plunify/intime $ sh ~/Downloads/intime_v1.1.0_64bit_linux.sh
    Verifying archive integrity... All good.
    Uncompressing Plunify InTime version 1.1.0......................................
    ................................................................................
    ................................................................................
    ................................................................................

The script extracts installation files and presents a licensing
agreement.

Hit \<space\> to scroll down or \"q\" to skip to the end. :

    PLUNIFY SOFTWARE LICENSE AGREEMENT REVISION 2014-01-09

    Copyright (c) 2009-2014, PLUNIFY All rights reserved.


    This Software License Agreement (the "Agreement") is a legally binding
    agreement between the User of the software (the "User") and PLUNIFY Pte Ltd
    ("PLUNIFY"), seated at 67 Ayer Rajah Crescent #03-20/22 Singapore 139950. By 
    using or installing the software (as updated by PLUNIFY from time to time, 
    the "Software"), the User is accepting to be bound by all of the terms and 
    conditions of this Agreement.
    --More--

Enter 'Y' to accept and proceed, or 'N' to exit the installer. :

    --------------------------------------------------------------------------------

    Accept the terms of the Plunify End-User Licensing Agreement ('y' for Yes or 'n' for No)? y

    Thank you, proceeding with installation...

There are three options for running builds (hit Enter to install the
defaults):

> -   \"Local\" - on a standalone PC where InTime is installed.
> -   \"Private Cloud\" - within the user's network.
> -   \"Plunify Cloud\" - using Plunify-managed cloud computing
>     resources.

*Local* is always installed, but the rest are optional. See
`run_targets`{.interpreted-text role="doc"} for more information on the
different options.

Hit \<Enter\> to install all the options.

    Install default modules (Recommended)? ('y' for Yes or 'n' for No) [y]

Otherwise, type \"n\" and press \<Enter\> to choose between the
\"Private Cloud\" and the \"Plunify Cloud\".

    Use a Private Cloud to compile your designs ('y' for Yes or 'n' for No) [y]

    Use a Plunify-managed Cloud to compile your designs ('y' for Yes or 'n' for No) [y]

Finally, the installer creates InTime-related shortcuts on the user's
desktop.

\newpage 

### Windows Installation

Please download the Windows installer:
`intime_v<InTime version>_64bit_win.exe`

Run the installer by double-clicking the downloaded file.

The installer wizard contains the following pages which guide you
through the installation process.

1.  Welcome page
2.  Accept license agreement
3.  Choose users
4.  Choose install directory
5.  Choose components
6.  Choose start menu folder
7.  Installation in progress\...
8.  Installation completed

!!! tip
    When installation completes, an uninstaller will be created. The
uninstaller can be accessed either through the created start menu item
or through the \"Add/Remove Programs\" dialog in Windows.

'