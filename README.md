# Agent-Oriented Visual Programming for the Web of Things

## Overview

This demo was presented at the Dagstuhl Seminar 23081 [Agents on The Web](https://www.dagstuhl.de/en/seminars/seminar-calendar/seminar-details/23081).

It showcases a [Web-based Agent IDE](https://github.com/Interactions-HSG/intelliot-hypermas-explorer) that allows domain experts to develop [JaCaMo](https://github.com/jacamo-lang/jacamo) agents using a visual block language that was developed with the University of St. Gallen in the context of the [IntellIoT](https://intelliot.eu/) European Project.

## Smart-farming use case
Once run, the demo shows two autonomous tractors that coordinate to reach the goal of maintaining a grid of fields well irrigated.

The grid is composed of 4x4 fields that can either be, depending on their humidity level:
* _Dry_ when they are beige
* _Normal_ when they are light brown
* _Irrigated_ when they are dark brown

Over time, the humidity level will decay randomly.

The home position for the tractors is (0,0) in the bottom left corner.

The system is composed of two agents that pilot two tractors:
* One (the red triangle) is a _soilchecker_ and is equipped with a sensor that can measure the humidity level of the soil in a field. The tractor is surveying the whole grid periodically in order to measure the humidity in the fields. If the humidity in a field is lower than a set treshold the tractor will communicate the waypoint to the _irrigator_.

* The other (the green triangle) is an _irrigator_ and is equipped with a water tank that can hold the amount of water to irrigate 4 fields. The irrigator will then idle at the home position (0,0) where it can also refill its tank and as soon as it receives 4 waypoints it will start to irrigate from the closest to the farthest. If the _soilchecker_ finish surveying the fields and is back at the home position the _irrigator_ will continue irrigating until it has reached all the waypoints even if it needs to take a trip without consuming its full capacity.


## Components
This demo is based upon three software components:

* [Web-based Agent IDE](https://github.com/Interactions-HSG/intelliot-hypermas-explorer) This component is the one that allows to create agents using a visual block languages that allows to define agents with the jason syntax. The visual language is designed to be easier for people to understand, since the target users of the tool are domain expert with little or no experience in programming.
* [MAS REST Runtime](https://github.com/samubura/mas-rest-runtime) this component is an implementation of a server wrapping a JaCaMo application. It uses JaCaMo-REST internally to run the multi-agent system that the user wants to execute.
* [Web-of-Things Web Simulator](https://github.com/samubura/wot-web-simulator) This is a simple JavaScript "simulator" for WoT devices. It is a Node.js server that exposes Thing Descriptions and implement the things APIs running simulated models of the devices with a fixed tick. 

# How to run the demo

## Dependencies
To run this demo you will need to have on your machine:
* Node.js with [`nodemon`](https://www.npmjs.com/package/nodemon) globally available
* Java 14
* A MongoDB client (e.g. MongoDB Compass)
* _optionally_ Docker or MongoDB installed locally

## 1) Clone the repository

First of all clone the repository
```
git clone https://github.com/samubura/dagstuhl-demo-wot-autonomous-tractors.git
```

Then enter the main folder and run the script
```
./init_submodules.sh
```
This will clone the repositories imported as submodules and bring them to the exact commits that were used at the time of the demo (to avoid future updates to break this demo).

## 2) Run the Web-based IDE

### *Using Docker*
The easiest way to run the IDE is using Docker.

Enter the `intelliot-hypermas-explorer` folder and add a file named `.env` with this content:
```
CLIENT_PORT=8090
SERVER_PORT=8000

MONGO_URL=mongodb://mongo:27017/masDB
```

Run the script to launch the whole app:
```
./launchDocker.sh
```

### *Standalone*
> MongoDB is used as the persistent storage to run the application as standalone MongoDB must be installed in your machine and the ``mongod`` command can be used in a shell.

Create a folder where the databases will be stored end edit the `launchMongoDB.sh` as needed. The script to launch the IDE is configured to create multiple databases to have multiple "workspaces".

The default for Windows users will be to create a `C:\data` folder.


Setup the repository with the script that installs npm dependencies:
```
./setup.sh
```

Run the script to launch the whole app with the name of the "workspace" hence the name of the folder that will contain the actual database:
```
./launchStandalone.sh tractors
```

## 3) Populate the Database
Using a MongoDB client, connect to the databse hosted at:
```
mongodb://localhost:27017 
```

Use the .json files in the `mongoData` folder of this repository to import the data in the corresponding collections.

## 3) Run the MAS REST Runtime
Open a new shell and enter the `mas-rest-runtime` folder.

Run with Gradle:
```
./gradlew run
```

## 4) Run the WoT Web Simulator
Open a new shell and enter the `wot-web-simulator` folder

First download the dependencies with:
```
npm install
```

Then you can run the application with
```
./run.sh
```

## 5) Use the application

Go to [`http://localhost:3000`](http://localhost:3000) to open the WoT Web Simulator and see the simulation.

Go to [`http://localhost:8090`](http://localhost:8090) to open the Web IDE.

There you can load the code saved on the DB and have a taste of the visual block language. Click on **Load** and select the agent you want to load from the dropdown.

You can also try out the block language to assemble other agents.

A _runtime configuration_ is already available to run the tractors example. Simply click on **Run** and select the runtime configuration you want to execute from the dropdown. This will start the multi-agent system on the MAS REST Runtime.

You can follow the MAS logs on the MAS REST Runtime shell.

To stop the MAS click to **Inspect Runtime** and click on the stop button.



