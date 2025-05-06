// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Crowdfunding {
    address public owner;
    uint public goal;
    uint public deadline;
    uint public raisedAmount;

    mapping(address => uint) public contributions;

    constructor(uint _goal, uint _durationInDays) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + (_durationInDays * 1 days);
    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Campaign has ended");
        require(msg.value > 0, "Contribution must be greater than zero");

        contributions[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(block.timestamp >= deadline, "Campaign still active");
        require(raisedAmount >= goal, "Funding goal not reached");

        payable(owner).transfer(address(this).balance);
    }

    function getSummary() public view returns (
        uint _goal,
        uint _raisedAmount,
        uint _timeLeft,
        bool _isGoalReached
    ) {
        _goal = goal;
        _raisedAmount = raisedAmount;
        _timeLeft = (block.timestamp >= deadline) ? 0 : (deadline - block.timestamp);
        _isGoalReached = raisedAmount >= goal;
    }
}
