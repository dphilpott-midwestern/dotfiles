#Terminal function for dialing into an MFA auth'ed AWS profile. Use: aws-<env> <mfa-code>
#Corresponding profile in .aws config should specfiy the region at least

function aws-<env> () {
        sts=`aws sts get-session-token --serial-number arn:aws:iam::<aws-account>:mfa/<aws-username> --profile <aws-profile-name> --token-code $1`
        export AWS_PROFILE="<aws-profile-name>"
        export AWS_DEFAULT_REGION="eu-west-2"
        export AWS_ACCESS_KEY_ID=`echo $sts | jq -r '.Credentials.AccessKeyId'`
        export AWS_DEFAULT_REGION="eu-west-2"
        export AWS_ACCESS_KEY_ID=`echo $sts | jq -r '.Credentials.AccessKeyId'`
        export AWS_SECRET_ACCESS_KEY=`echo $sts | jq -r '.Credentials.SecretAccessKey'`
        export AWS_SESSION_TOKEN=`echo $sts | jq -r '.Credentials.SessionToken'`
}
