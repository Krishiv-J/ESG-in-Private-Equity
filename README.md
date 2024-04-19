# README

## Overview

This repo contains the data, R scripts, shiny web app, and final PDF report used. 

This repo contains the data, R scripts and final PDF report used in a reproduction of Markarian, Rakotobe, and Semionov's "ESG in the Top 100 US Private Equity Firms" (2023). Modifications are made to the data, variables considered, and methodology. This paper finds a positive relationship between IRR and ESG scores, contrasting with the original study's results. Whilst using different data sources for 'Log Fund Size' and 'Staff Count', this study also shows no significant link between these variables and ESG scores.

Link to the original paper: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4503661

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from the original paper.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains a fitted models. 
-   `other` details about LLM chat interactions and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Statement on LLM usage

No auto-complete tools such as co-pilot were used in the course of this project. Aspects of the code were written with the help of Chat GPT. The entire chat history is available in `other/llms/usage.txt`.
