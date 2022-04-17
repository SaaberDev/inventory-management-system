# Inventory Management System

## Features

## TODO
* jquery fix in purchase and transfer edit ✅
* transfer released goods ✅
* sell released and finished goods
* track inventory
* track transfer
* CMS
* Add each warehouse stock limit
* add a chart each inventory
* add profit and loss chart
* show attachment in purchase and sale single view
* search function
* custom invoice system for budgeting
* payroll system
* attendance system [fingerprint if possible]


## Purchase to Sale Workflow

```
.
├── Purchase
│   └── Store in purchase warehouse
├── Transfer
│   └── Transfer purchased products from purchase warehouse to any warehouse
├── Release Products
│   ├── Release from warehouse as released product / finished product
│   └── Transfer
│       ├── Transfer released product to any relevent warehouse
│       └── Transfer finished product to any relevent warehouse
│       └── Transfer both released product and finished product to finished goods warehouse to sell (because user can sell both type of product)
└── Sell
    └── Sell both released product and finished product when it is available in finished goods warehouse
```


