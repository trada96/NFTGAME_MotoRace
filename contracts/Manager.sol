contract Manager{
    address public ceo; // SET ADDRESS PERMISSION FOR CEO
    address public manager;

    constructor() public{
        manager = msg.sender;
    }

    modifier onlyManager{
        require(msg.sender ==  manager || msg.sender == ceo, "You dot not have permission!");
        _;
    }

    function changeManager(address new_manager) public {
        require(msg.sender == ceo, "You dot not have permission!");
        manager = new_manager;
    }

    function withdraw() external     modifier onlyManager{
{
        payable((msg.sender)).transfer(address(this).balance);
    }
}