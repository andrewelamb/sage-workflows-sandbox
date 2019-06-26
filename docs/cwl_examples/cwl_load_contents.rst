Staging Folders
================

.. meta::
    :description lang=en: Loading file contents

The main purpose for using load contents is when you need the output from a step to be aomethign other than a file.

Part 1: Outputs
--------------------------------------------

Say you want to output the number of lines in a cwltool:



.. code-block:: YAML


	#!/usr/bin/env cwl-runner

	cwlVersion: v1.0

	class: CommandLineTool

	requirements:
	- class: InlineJavascriptRequirement

	baseCommand: 
	- wc 
	- -l

	stdout: output.txt

	inputs:

	- id: file
	  type: File
	  inputBinding:
	    position: 1

	outputs:

	- id: lines
	  type: int
	  outputBinding:
	    glob: output.txt
	    loadContents: true
	    outputEval: $(parseInt(self[0].contents.split(/(\s+)/)[0]))

This tool will create a file to stdout that looks like: "87 file.txt"

We want the number 87, as an integer to pass on. 

.. code-block:: YAML

	loadContents: true 

The above line would return all the text of the file as a string

.. code-block:: YAML

	outputEval: $(parseInt(self[0].contents.split(/(\s+)/)[0]))

The above parses the text into just the number as an integer
