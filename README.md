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
    <li><a href="#endpoints">Endpoints</a></li>
    <li><a href="#sample-request">Sample Request</a></li>
    <li><a href="#repo-automation">Repo Automation</a></li>
  </ol>
</details>

## About

- Project title
- Project description (at this stage you can have few paragraphs or bullet points to describe what do you think the project is for)
- Why are you building this? (rationale why is it’s needed, how it’s supporting your goals etc)
- The owner (who is responsible for building or driving this if there are multiple people)



What is an API, really?

PoC for running a lightweight page with all the intensive stuff on remote

This is the main repo for **Superpowers**.
The goal of this project is to provide




## Architecture

The project has three distinct components:
1. **Lambda functions**

    The foundation of **Superpowers** is a set of *Lambda functions*.

    The main sub dir is <a href="https://github.com/TM312/superpowers/tree/master/functions">functions</a>.

2. **Terraform configuration**

    The corresponding infrastructure is managed using *Terraform*.

    The main sub dir is <a href="https://github.com/TM312/superpowers/tree/master/terraform">terraform</a>.

3. **Landing page**

    The frontend serving as the main entry point for potential/new customers is based on *Nuxt* using *TailwindCSS*.

    The main sub dir is <a href="https://github.com/TM312/superpowers/landing/tree/master/landing">landing</a>.

3. **Documentation**

    The documentation is covers
      - the general API structure
      - descriptions of individual services
      - glossary

    It is based on *Nuxt Content > Docs Theme* using *TailwindCSS* allowing it to be written as *markdown* files.
    It is developed inside the separated and public repo named [sp_docs](https://github.com/TM312/sp_docs).



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

## Principles (ideas)
- robust, tested services
- extensive, well-structured documentation (open-source)
- develop at own pace, but releases in weekly/bi-weekly cycles



## Repo Automation

This repo uses the following bots:
- [Dependabot](https://dependabot.com/)
- [Pull](https://wei.github.io/pull/): Keep your forks up-to-date via automated PRs
- [Semantic Pull Requests](https://github.com/zeke/semantic-pull-requests): Ensure that every PR has just enough semantic information to be able to trigger a release when appropriate
- [Todo](https://todo.jasonet.co/): Automagically creates new issues based on comments and keywords in your code when you push it to GitHub
