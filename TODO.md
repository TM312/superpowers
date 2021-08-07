# PROJECT PLANNING

## TODOs

## high
- [] Core vision/strength/interest discussion > Fill out README::About/Principles
- [] First version scoping
- [] Find proper tool for project planning
- [] Lambda function dependencies as Docker Image -> wireframe
- [] Landing Page >> Inspiration [Linear.app](https://linear.app/), [Vercel](https://vercel.com/), [Stripe](https://stripe.com/en-sg)
- [x] Documentation base: Nuxt documentation adapt?


## normal
- [] Define Git strategy/branches
- [] How to handle API versioning? as parameter? and internally?
- [] Marketing: Build in public/Twitter?
- [] Move terraform state to S3 bucket for shared management
- [] Select testing frameworks frontend/lambda [article on testing lambda functions](https://towardsdatascience.com/how-i-write-meaningful-tests-for-aws-lambda-functions-f009f0a9c587), [testing lib for boto3/AWS SDK](http://docs.getmoto.org/en/latest/)
- [] standardized lambda test base, e.g. 1. test false/correct argument types, 2. test normal behavior, 3. invalid argument values, 4. extrem inputs
- [] Standardized Error handling
- [] User Authentication handling, how?
- [] How to make API calls for users?
- [] How to store user related data, e.g. email, team, token?



## low
- [] sketch logo
- [] define name & get domain

## future low
- [] Integration with FaunaDB for data services [I like this side by Vercel](https://vercel.com/integrations/datadog-logs)
- [] Playground to test rendering
- [] Integration templates: API calls, Nuxt/React/HTML-JS-axios components
- [] Automated Terraform script creation



> "At Linear, we started only supporting Google Logins since that was the fastest way to build authentication and then move on to other features. We knew that eventually, we would have to support pure email and other login methods.
[source](https://medium.com/linear-app/building-at-the-early-stage-e79e696341db)
