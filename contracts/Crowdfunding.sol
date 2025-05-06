// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Crowdfunding {
    address public owner;
    uint public goal;
    uint public deadline;
    uint public raisedAmount;
    bool public isWithdrawn;

    mapping(address => uint) public contributions;
    address[] public contributors;

    constructor(uint _goal, uint _durationInDays) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + (_durationInDays * 1 days);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier campaignActive() {
        require(block.timestamp < deadline, "Campaign ended");
        _;
    }

    function contribute() public payable campaignActive {
        require(msg.value > 0, "Contribution must be greater than zero");

        if (contributions[msg.sender] == 0) {
            contributors.push(msg.sender);
        }

        contributions[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }

    function withdraw() public onlyOwner {
        require(block.timestamp >= deadline, "Campaign still active");
        require(raisedAmount >= goal, "Goal not reached");
        require(!isWithdrawn, "Already withdrawn");

        isWithdrawn = true;
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

    // Additional Functions (10)

    function getDeadline() public view returns (uint) {
        return deadline;
    }

    function getGoal() public view returns (uint) {
        return goal;
    }

    function getRaisedAmount() public view returns (uint) {
        return raisedAmount;
    }

    function getContributorCount() public view returns (uint) {
        return contributors.length;
    }

    function getContributionOf(address contributor) public view returns (uint) {
        return contributions[contributor];
    }

    function getAllContributors() public view returns (address[] memory) {
        return contributors;
    }

    function isCampaignSuccessful() public view returns (bool) {
        return raisedAmount >= goal && block.timestamp >= deadline;
    }

    function isCampaignActive() public view returns (bool) {
        return block.timestamp < deadline;
    }

    function isOwner(address user) public view returns (bool) {
        return user == owner;
    }

    function hasWithdrawn() public view returns (bool) {
        return isWithdrawn;
    }
}
