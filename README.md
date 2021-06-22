What Is Icarus Verilog?

Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format. For batch simulation, the compiler can generate an intermediate form called vvp assembly. This intermediate form is executed by the ''vvp'' command. For synthesis, the compiler generates netlists in the desired format.
The compiler proper is intended to parse and elaborate design descriptions written to the IEEE standard IEEE Std 1364-2005. This is a fairly large and complex standard, so it will take some time to fill all the dark alleys of the standard, but that's the goal.

Icarus Verilog is a work in progress, and since the language standard is not standing still either, it probably always will be. That is as it should be. However, I will make stable releases from time to time, and will endeavor to not retract any features that appear in these stable releases. The quick links above will show the current stable release.

The main porting target is Linux, although it works well on many similar operating systems. Various people have contributed precompiled binaries of stable releases for a variety of targets. These releases are ported by volunteers, so what binaries are available depends on who takes the time to do the packaging. Icarus Verilog has been ported to That Other Operating System, as a command line tool, and there are installers for users without compilers. You can compile it entirely with free tools, too, although there are precompiled binaries of stable releases.

Where is Icarus Verilog?

NOTE: This is a quick summary of where to get Icarus Verilog. for more complete download and install instructions, look -->here.

The Current release is available in source and a variety of binary forms in the FTP directory <ftp://ftp.icarus.com/pub/eda/verilog/v11/>. Updates to the stable release may be made from time to time to fix problems, but there should be no compatibility issues within this version series. This will continue to be maintained until rendered obsolete by a new stable release.
Development snapshots are made fairly often, and made available in the FTP directory <ftp://icarus.com/pub/eda/verilog/snapshots>. The files are gzip compressed tar files that contain the source and makefiles. These snapshots follow development progress, and, although the latest features are included in this source, compatibility from snapshot to snapshot is not guaranteed.

And finally, the current "git" repository is available for read-only access via anonymous git cloning. This allows for those who which to track my progress and contribute with patches timely access to the most bleeding edge copy of the source. Access the git repository of Icarus Verilog with the commands:
```
git clone git://github.com/steveicarus/iverilog.git
```
(Note: The older CVS repository is obsolete.)
From here, you can use normal git commmands to update your source to the very latest copy of the source. See the Installation Guide for details on how to access and compile the git repository.

2.2 Compilation

Unpack the tar-ball and cd into the verilog-######### directory
(presumably, that is how you got to this README) and compile the source
with the commands:

 ``` iverilog filename.v```
 
 
 ``` iverilog filename_tb.v```
 
 
  ```./a.out```
