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


## Workflow

```
.
├── Purchase
│   └── Store in purchase warehouse
├── Transfer
│   └── Transfer purchased products from purchase warehouse to any warehouse
├── Release Products
│   ├── Release from warehouse as released product / finished product
│   └── Transfer
│       ├── Transfer released product to another warehouse
│       └── Transfer directly to the finished goods (finished goods are sellable)
└── Sell  
└── Sell both released product and finished product when it is available in finished goods
```


