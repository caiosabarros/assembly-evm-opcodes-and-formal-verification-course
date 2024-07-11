// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

abstract contract CounterTest is Test {
    Counter counter;
    string location = "Counter";

    function setUp() public virtual {
        counter = new Counter();
    }
}
