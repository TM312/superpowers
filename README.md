# S-U-P-E-R-P-O-W-E-R-S

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="#">
    <img src="images/logo.png" alt="Superpowers Logo" width="197" height="62">
  </a>

  <h3 align="center">S-U-P-E-R-P-O-W-E-R-S</h3>

  <p align="center">
    ML Services as API calls
    <br />
    <a href="https://github.com/TM312/superpowers/issues"><strong>Report Bug/Request feature »</strong></a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about">About</a>
    </li>
    <li><a href="#architecture">Architecture</a></li>
    <li><a href="#API-structure">API Structure</a></li>
    <li><a href="#deployment-environments">Deployment Environments</a></li>
  </ol>
</details>

## About
What is an API, really?

PoC for running a lightweight page with all the intensive stuff on remote

This is the main repo for **Superpowers**.
The goal of this project is to provide


For specifics on technical aspects, you may refer directly to the sub-pages:


## Architecture

The project has three distinct components:
1. **Lambda functions**

    The foundation of **Superpowers** is a set of *Lambda functions*.

    The main sub dir is <a href="https://github.com/TM312/superpowers/tree/master/functions">functions</a>.


2. **Terraform configuration**

    The corresponding infrastructure is managed using *Terraform*.

    The main sub dir is <a href="https://github.com/TM312/superpowers/tree/master/terraform">terraform</a>.

3. **Frontpage**

    The frontend serving as the main entry point for potential/new customers is based on *Nuxt* using *TailwindCSS*.

    The main sub dir is <a href="https://github.com/TM312/superpowers/tree/master/front">front</a>.



## Deployment Environments

Three environments are used for a staged code deployment process:


| Name         | Address  |
| :--------------- |:---------------|
| dev      | *tbd* |
| stage      | *tbd* |
| prod      | *tbd* |



<br>


## Endpoints

| Endpoint         | Name           | Auth          | Description       |
| :--------------- |:---------------| :--------------- |:---------------|
| /      | Main | True | Returns the result of the functions |
| /help      | Help | False | Provides i) general information about how to use the main endpoint and ii) specific details. |
| /sample      | Sample | False | Returns sample data for each   |
| /statistics      | Statistics | False | Returns statistics for each service.|


## Sample Request

```py
{
    'data': [1,2,3,4],
    'services': [
        {
            'position':1,
            'name': 'get_sum',
        },
        {
            'position':2,
            'name': 'get_rounded',
        }
    ],
    'visualization': None
}
```
