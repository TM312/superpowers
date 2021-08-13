# PROJECT PLANNING


## TODOs

## immediate next steps:
- [x] @Thomas: Provide access for alexis to repo
- [ ] @Thomas: Properly setup documentation
- [ ] @Thomas: Setup landing
- [ ] @Alexis: Research valuable, feasible functions
- [ ] @both: Research authentication
- [ ] @both: Brainstorm name & logo


## State in 2 weeks
- 5 useful functions -> check huggingface fo usefule models?
- initial version documentation
- design landing page
– discussion on authentication method


## high
- [ ] Core vision/strength/interest discussion > Fill out README::About/Principles
- [ ] First version scoping
- [ ] Find proper tool for project planning, maybe [Linear](https://linear.app/)?
- [ ] Lambda function dependencies as Docker Image -> wireframe [AWS Article](https://aws.amazon.com/blogs/machine-learning/using-container-images-to-run-pytorch-models-in-aws-lambda/), [terraform example](https://github.com/terraform-aws-modules/terraform-aws-lambda/blob/v2.7.0/examples/container-image/main.tf), [tf example pt.2](https://registry.terraform.io/modules/terraform-aws-modules/lambda/aws/latest/examples/container-image#output_docker_image_uri)
- [ ] Landing Page >> Inspiration [Linear](https://linear.app/), [Vercel](https://vercel.com/), [Stripe](https://stripe.com/en-sg)
- [x] Documentation base: Nuxt documentation adapt?


## normal
- [ ] Define Git strategy/branches
- [ ] How to handle API versioning? as parameter? and internally?
- [ ] Marketing: Build in public/Twitter? Check on work policy
- [ ] Move terraform state to S3 bucket for shared management
- [ ] Select testing frameworks frontend/lambda [article on testing lambda functions](https://towardsdatascience.com/how-i-write-meaningful-tests-for-aws-lambda-functions-f009f0a9c587), [testing lib for boto3/AWS SDK](http://docs.getmoto.org/en/latest/)
- [ ] standardized lambda test base, e.g. 1. test false/correct argument types, 2. test normal behavior, 3. invalid argument values, 4. extrem inputs
- [ ] Standardized Error handling
- [ ] User Authentication handling, how?
- [ ] How to make API calls for users?
- [ ] How to store user related data, e.g. email, team, token?


## Thomas
- [ ] Combine nuxt/auth with nuxt-orm -> example: [Github Repo](https://github.com/guillaumebriday/todolist-frontend-nuxt)
- [ ] Feature: Add regions to request (codes on hover)
- [ ] Feature: Add region page as reference (map or globe with Zones and names)
- [ ] Feature: Calculate avg response time for requests
- [ ] Feature: Add async support to requests
- [ ] Feature: Add 'can be combined with' to request
- [ ] Write About



## low
- [ ] sketch logo
- [ ] define name & get domain

## future low
- [ ] Integration with FaunaDB for data services [I like this side by Vercel](https://vercel.com/integrations/datadog-logs)
- [ ] Playground to test rendering
- [ ] Integration templates: API calls, Nuxt/React/HTML-JS-axios components
- [ ] Automated Terraform script creation



> "At Linear, we started only supporting Google Logins since that was the fastest way to build authentication and then move on to other features. We knew that eventually, we would have to support pure email and other login methods.
[source](https://medium.com/linear-app/building-at-the-early-stage-e79e696341db)
