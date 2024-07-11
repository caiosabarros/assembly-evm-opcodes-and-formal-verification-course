// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {CounterTest} from "./BaseCounter.t.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {Counter} from "../src/Counter.sol";

contract CounterHUFFTest is CounterTest {
    Counter counterHuff;

    function setUp() public override {
        super.setUp();
        counterHuff = Counter(HuffDeployer.config().deploy(location));
        assertEq(counterHuff.retrieve(), 0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.retrieve(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.retrieve(), x);
    }
}
