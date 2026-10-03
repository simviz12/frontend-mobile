# Guardian Mobile - Frontend

## Overview
Flutter application for the Guardian Mobile anti-theft system.

## Architecture
`mermaid
graph TD;
  UI-->Presentation;
  Presentation-->Domain;
  Data-->Domain;
  Data-->API[(Backend API)];
`

## Setup
1. lutter pub get
2. lutter run

## Testing
lutter test

## GitFlow
Feature branches from develop, merged via PR.
