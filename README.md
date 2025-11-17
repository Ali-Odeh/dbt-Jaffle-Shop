# dbt Jaffle Shop

A sample dbt project demonstrating data transformation and modeling best practices.

## Overview

This project contains dbt models for the fictional Jaffle Shop e-commerce business, transforming raw data from Jaffle Shop and Stripe into analytics-ready dimensional models.

The Jaffle Shop dataset includes customer orders and payment information, demonstrating common dbt patterns like:
- Staging layers for data cleaning and standardization
- Dimensional modeling for analytics
- Data quality testing
- Documentation and metadata management

## Project Structure

- `models/staging/` - Staging models that clean and standardize raw data
  - `jaffle_shop/` - Customer and order data
  - `stripe/` - Payment data
- `models/marts/` - Analytics-ready dimensional models
- `seeds/` - CSV files with static data (payment methods, status mappings)
- `tests/` - Custom data quality tests
- `macros/` - Reusable SQL macros

## Getting Started

1. Install dbt and configure your database connection
2. Run `dbt deps` to install dependencies
3. Run `dbt seed` to load seed data
4. Run `dbt run` to build models
5. Run `dbt test` to validate data quality

## Models

### Marts
- `dim_customers` - Customer dimension table with aggregated metrics including:
  - First and most recent order dates
  - Total number of orders per customer
  - Customer lifetime value

### Staging
- `stg_jaffle_shop__customers` - Cleaned and standardized customer data from the Jaffle Shop system
- `stg_jaffle_shop__orders` - Standardized order transactions with consistent column naming
- `stg_stripe__payment` - Payment records from Stripe with status mappings and validations

## Seeds

- `payment_methods.csv` - Reference data for payment method types
- `payment_status_mapping.csv` - Mapping for payment status codes

## Tests

The project includes custom tests to ensure data quality:
- `assert_stg_stripe_payment_total_positive.sql` - Validates that all payment amounts are positive values

## Macros

- `formatting_macros.sql` - Reusable SQL functions for consistent formatting across models

## Documentation

Generate and view documentation:
```bash
dbt docs generate
dbt docs serve
```

This will create a documentation website with:
- Lineage graphs showing data flow between models
- Column-level descriptions and data types
- Model dependencies and relationships
- Test results and model statistics

## Key Features

- **Modular Design**: Separate staging and mart layers for maintainability
- **Data Quality**: Built-in tests and assertions to ensure data integrity
- **Best Practices**: Follows dbt naming conventions and project structure standards
- **Documentation**: Comprehensive inline documentation and metadata
