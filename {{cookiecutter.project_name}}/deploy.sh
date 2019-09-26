sam build
sam package --output-template packaged.yml --s3-bucket {{ cookiecutter.s3_bucket }}
sam deploy --stack-name {{ cookiecutter.project_name }} --region {{ cookiecutter.aws_region }} --template-file packaged.yml --capabilities CAPABILITY_IAM
aws cloudformation describe-stacks --stack-name {{ cookiecutter.project_name }} --region {{ cookiecutter.aws_region }} --query 'Stacks[].Outputs'
