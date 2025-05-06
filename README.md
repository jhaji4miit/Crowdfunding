# Crowdfunding

## Project Description

This Crowdfunding project is a decentralized smart contract designed to allow individuals or organizations to create goal-based fundraising campaigns on the blockchain. Contributors can fund the campaign before the deadline. If the target is met, the campaign owner can withdraw the funds.

## Project Vision

To decentralize and democratize fundraising by removing middlemen and ensuring secure, transparent, and goal-oriented fund collection for any cause—be it social, creative, emergency, or entrepreneurial.

## Key Features

- **Campaign Creation**: Deployable with a funding goal and time limit.
- **Contribution Tracking**: Users can contribute and have their amounts recorded securely.
- **Deadline Management**: Contributions accepted only before a fixed deadline.
- **Owner-Only Withdrawal**: Owner can withdraw funds only if the goal is met.
- **Automatic Goal Check**: System checks if the funding goal has been met.
- **Public Visibility**: Anyone can view campaign status and stats.

## Advanced Features (10 Additional Functions)

- `getDeadline()`: Returns the campaign's end time.
- `getGoal()`: Returns the fundraising goal.
- `getRaisedAmount()`: Returns total funds collected.
- `getContributorCount()`: Returns the number of unique contributors.
- `getContributionOf(address)`: Shows how much a specific address contributed.
- `getAllContributors()`: Returns the list of all contributors.
- `isCampaignSuccessful()`: Indicates if the campaign met its goal after the deadline.
- `isCampaignActive()`: Indicates if the campaign is still ongoing.
- `isOwner(address)`: Checks if a given address is the contract owner.
- `hasWithdrawn()`: Shows whether the funds have been withdrawn by the owner.

## Future Scope

- Enable refunding contributors if the goal isn't reached.
- Add a UI with MetaMask integration.
- Support for multiple simultaneous campaigns.
- NFT badges or rewards for top contributors.
- Admin dashboard and campaign analytics.
- Chainlink oracle integration for verifiable off-chain data.

## Contract Details
0xD7c44d880B3D1749b5b3AEE8ce8970541b6960eF
![Uploading image.png…]()
