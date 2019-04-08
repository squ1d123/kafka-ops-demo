# KAFKA OPS DEMO

This is to demontrate what we can use to automate kafka operations such as adding ACLs, Topics and Topic Configs.

## Requrements

- [Terraform][terraform]
- [Kafka provider for terraform][terraform-kafka-provider]
- Optional
  - [docker-compose][docker-compose] will be required if wanting to run against a local instance of kafka

## Running Locally

```bash
# Bring up kafka
docker-compose up -d

# See what will change when terraform runs.
terraform plan

# Apply the changes
terraform apply
```

## Future work

- Integrate jenkins hook

[terraform]: https://www.terraform.io/
[terraform-kafka-provider]: https://github.com/Mongey/terraform-provider-kafka
[kafka-topics-ui]: https://github.com/Landoop/kafka-topics-ui
