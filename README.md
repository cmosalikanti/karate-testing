# Karate Project

## About
This project aims to understand the Karate project - An API Testing framework available at https://www.karatelabs.io/

## The below are the pre-requisites
1. Java
2. Maven
3. Your favourite IDE

## Plugins
Install the Karate plugin for your IDE. For e.g., in IntellijIDEA, it is at https://plugins.jetbrains.com/plugin/19232-karate

## How to set up the project
1. Clone the repo from:
```
git@github.com:cmosalikanti/karate-testing.git
```
2. Open a terminal and navigate to the folder 'karate-testing'
3. Run the below command:
```
./mvnw clean test
```
4. Import the project into your favourite IDE.

## Running a subset of tests (via tags)
```
./mvnw clean test -Dkarate.options="--tags @createUser"

```