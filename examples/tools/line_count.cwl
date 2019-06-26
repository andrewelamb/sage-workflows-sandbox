#!/usr/bin/env cwl-runner

$namespaces:
  s: https://schema.org/

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-0326-7494
    s:email: andrew.lamb@sagebase.org

s:name: Andrew Lamb

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
