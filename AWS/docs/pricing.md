# Pricing and Cost Management in AWS

This section shows the pricing and cost management of the AWS cloud services. See the [slides](https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/HydrosatTrainingSlides/Hydrosat_AWS_Pricing_Support.pdf) that support you while choosing the services and managing your costs: 

[![](https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/HydrosatTrainingSlides/slides2.png)](https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/HydrosatTrainingSlides/Hydrosat_AWS_Pricing_Support.pdf)

When you use AWS, you spin up resources only when you need them, and you pay only for what you use.
Instead of having a fixed cost like you would have in a traditional on-premises environment, you instead incur a variable cost.
This is fundamentally different than the way costs were managed on-premise, and therefore, has shifted the way that costs are understood, managed, and optimized. 

To optimize costs, you want to establish best practices for cost management, and use tools to monitor and analyze costs over time. AWS offers multiple cost management tools through the AWS Management Console. Such as:

- [AWS Cost Explorer](#aws-cost-explorer)
- [AWS Budgets](#aws-budgets)
- [AWS Trusted Advisor](#aws-trusted-advisor)
- [AWS Pricing Calculator](#aws-pricing-calculator)




## AWS Cost Explorer

[AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/) lets you visualize, understand, and manage your AWS costs and usage over time. You can create custom reports (including charts and tabular data) that analyze cost and usage data, both at a high level (e.g., total costs and usage across all accounts) and for highly specific requests (e.g., m2.2xlarge costs within account Y that are tagged project: secretProject).

- User interface for exploring your AWS Costs
- It provides breakdowns incluing:
	- by service
	- by cost tag
- Provides predictions for __the next three monthes of costs__
- Gives recommendations for cost optimization 
- Can be accsssed via API

## AWS Trusted Advisor


[AWS Trusted Advisor](https://aws.amazon.com/premiumsupport/technology/trusted-advisor/) is an online resource to help you reduce costs, increase performance, and improve security by optimizing your AWS environment. Trusted Advisor provides real-time guidance to help you provision your resources by following our best practices.




## AWS Pricing Calculator


Also called Total Ownership Calculator ([TOC](https://aws.amazon.com/blogs/aws/new-cloud-tco-comparison-calculator-for-web-applications/)), AWS has announced a new pricing tool, the [AWS Pricing Calculator](https://calculator.aws/#/). This new tool, which is currently in beta, can be used to calculate Amazon EC2 and Amazon EBS pricing. For further information about this tool, see this [blog](https://aws.amazon.com/blogs/aws/check-it-out-new-aws-pricing-calculator-for-ec2-and-ebs/) post. For other services, you can use the [AWS Simple Monthly Calculator](https://calculator.s3.amazonaws.com/index.html).



## AWS Budgets

[AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/) allows you to create alerts when your costs or usage exceeds a threshold over a specific time period. You define the time period, whether it be a week, month, or year, and you also define your thresholds. When you exceed the threshold, a notification can be sent out.











## Refrences


- [How does AWS pricing work?](https://aws.amazon.com/pricing/)
- [AWS Total Cost of Ownership (TCO) Calculator](https://subscription.packtpub.com/book/cloud_and_networking/9781788398299/1/ch01lvl1sec08/aws-total-cost-of-ownership-tco-calculator)