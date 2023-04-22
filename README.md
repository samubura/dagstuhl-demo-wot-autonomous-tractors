# dagstuhl-demo-wot-autonomous-tractors

This demo was presented at the Dagstuhl Seminar 23081 [Agents on The Web](https://www.dagstuhl.de/en/seminars/seminar-calendar/seminar-details/23081).

It showcases a [Web-based Agent IDE](https://github.com/Interactions-HSG/intelliot-hypermas-explorer) that allows domain experts to develop [JaCaMo](https://github.com/jacamo-lang/jacamo) agents using a visual block language that was developed with the University of St. Gallen in the context of the [IntellIoT](https://intelliot.eu/) European Project.

## Description
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

## How to run the demo
1.
2.
3.
4.
5.
