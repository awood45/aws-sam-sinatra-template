# {{ cookiecutter.project_name }}

This provides the setup for running a Sinatra application on the Ruby runtime for AWS Lambda.

## Running Locally

```shell
sam build
sam local start-api
```

## Testing on AWS Lambda

```shell
sam build
sam package --output-template packaged.yaml --s3-bucket my-source-s3-bucket
sam deploy --stack-name {{ cookiecutter.project_name }} --template-file packaged.yaml --capabilities CAPABILITY_IAM
aws cloudformation describe-stacks --stack-name {{ cookiecutter.project_name }} --query 'Stacks[].Outputs'
```

The final command will return the API Gateway endpoint.

## How It Works

This template stands up a Sinatra app on a single AWS Lambda function, configuring AWS API Gateway to pass through all requests as a proxy, and wiring up Rack to communicate back and forth with the Ruby runtime for AWS Lambda.

All you have to do generally is write your Sinatra app like normal. One "gotcha" to account for is that links and routes behave slightly differently if you're not using a custom API Gateway domain name. For example, the default URL has a "Prod" stage appended on the path. Consider this example of an app where the main route `/` renders a form, to which you can post to `/new-post`, which should redirect you to the root path. In the current form of the template, you'd need to do this:

```ruby
get "/" do
  erb :index
end

post "/new-post" do
  # do new post logic
  redirect "/Prod"
end
```
