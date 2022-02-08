pragma solidity ^0.8.11;

import "./Manager.sol";
import "./ERC721.sol";


library Motobikes {
    struct Motobike {
        Ability ability;
        Base base;
        SaleInfo saleInfo;
        Status status;
        History history;
        Initial initial;
    }

    struct Initial{
        bool ability;
        bool base;
        bool saleInfo;
        bool status;
    }

    struct Ability{
        uint8 rank; // Thứ hạng sau mỗi mùa
        uint8 speed; //
        uint8 stamina; // Độ bền của xe
        uint8 sprintForce;
    }

    struct Base{
        uint8 avatar;
        uint8 color;
        uint8 brand; // Hãng xe
    }

    struct SaleInfo{
        uint salePrice;
        bool isForSale;
    }

    struct Status{
        uint8  raceTimes; // Thơi gian đã đua
    }

    struct History{
        uint16 total_win;
        uint16 total_lose;
        uint16 avg_win;
    }

    function set_ability(Motobike storage m, Ability memory ability) internal{
        m.initial.ability = true;
        m.ability = ability;

    }

    function set_base(Motobike storage m, Base memory base) internal {
        m.initial.base = true;
        m.base = base;
    } 

    function set_sale_info(Motobike storage m, SaleInfo memory saleInfo) internal {
        m.initial.saleInfo = true;
        m.saleInfo = saleInfo;
    }

    function set_status(Motobike storage m, Status memory status) internal {
        m.initial.status = true;
        m.status = status;
    }
}   

contract TradaRace is Manager, ERC721{
    using Motobikes for Motobikes.Motobike;
    using Motobikes for Motobikes.Ability;
    using Motobikes for Motobikes.Base;
    using Motobikes for Motobikes.SaleInfo;
    using Motobikes for Motobikes.Status;
    using Motobikes for Motobikes.History;

    mapping(uint => Motobikes.Motobike) Motobikes;

    using Address for address;

    uint createId;
    uint initAmount = 1000000;
    string Name;
    string Symbol;
    address _race;
    address _raceToken;
    address _Game;

    constructor() public ERC721(){
        createId = initAmount.add(1);
        __ownedTokensCount[address(this)].setBalace(1000000);
        Name = "MotoRace NFT";
        Symbol = "MR";
    }

    function setRace(address _address) public onlyManager{
        require(_address != address(0), "Race contract address is null");
        _race = _address;
    }

    function race() public view returns(address){
        require(_race != address(0), "Race contract address is null");
        return _race;
    }

    function setRaceToken(address _address) public onlyManager {
        
        
    }
}