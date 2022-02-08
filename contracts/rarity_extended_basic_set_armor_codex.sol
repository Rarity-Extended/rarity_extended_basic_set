//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract basic_set_armors_codex {
    string constant public index = "Items";
    string constant public class = "Armor";
    
    function get_proficiency_by_id(uint _id) public pure returns (string memory description) {
        if (_id == 1) {
            return "Light";
        } else if (_id == 2) {
            return "Medium";
        } else if (_id == 3) {
            return "Heavy";
        } else if (_id == 4) {
            return "Shields";
        }
    }

    function item_by_id(uint _id) public pure returns(
        uint id,
        uint cost,
        uint proficiency,
        uint weight,
        uint armor_bonus,
        uint max_dex_bonus,
        int penalty,
        uint spell_failure,
        string memory name,
        string memory description
    ) {
        if (_id == 1) {
            return haunted_cloak();
        } else if (_id == 2) {
            return dead_hero_cape();
        } else if (_id == 3) {
            return slain_warrior_armor();
        } else if (_id == 4) {
            return random_shield();
        }
    }

    function haunted_cloak() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint weight,
        uint armor_bonus,
        uint max_dex_bonus,
        int penalty,
        uint spell_failure,
        string memory name,
        string memory description
    ) {
        id = 1;
        name = "Haunted cloak";
        cost = 560e18;
        proficiency = 1;
        weight = 10;
        armor_bonus = 1;
        max_dex_bonus = 8;
        penalty = 0;
        spell_failure = 20;
        description = "It has a life of its own, it protects those who use it.";
    }

    function dead_hero_cape() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint weight,
        uint armor_bonus,
        uint max_dex_bonus,
        int penalty,
        uint spell_failure,
        string memory name,
        string memory description
    ) {
        id = 2;
        name = "Dead hero cape";
        cost = 790e18;
        proficiency = 1;
        weight = 5;
        armor_bonus = 1;
        max_dex_bonus = 4;
        penalty = 0;
        spell_failure = 5;
        description = "We honor his former owner, a hero with no name.";
    }

    function slain_warrior_armor() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint weight,
        uint armor_bonus,
        uint max_dex_bonus,
        int penalty,
        uint spell_failure,
        string memory name,
        string memory description
    ) {
        id = 3;
        name = "Slain warrior armor";
        cost = 200e18;
        proficiency = 2;
        weight = 30;
        armor_bonus = 5;
        max_dex_bonus = 3;
        penalty = -4;
        spell_failure = 25;
        description = "I hope you find it useful.";
    }

    function random_shield() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint weight,
        uint armor_bonus,
        uint max_dex_bonus,
        int penalty,
        uint spell_failure,
        string memory name,
        string memory description
    ) {
        id = 4;
        name = "It's a random shield";
        cost = 200e18;
        proficiency = 4;
        weight = 30;
        armor_bonus = 5;
        max_dex_bonus = 3;
        penalty = -4;
        spell_failure = 25;
        description = "Yep, random";
    }

    function sorcerer_hat() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint weight,
        uint armor_bonus,
        uint max_dex_bonus,
        int penalty,
        uint spell_failure,
        string memory name,
        string memory description
    ) {
        id = 8;
        name = "Sorcered Hat";
        cost = 10e18;
        proficiency = 1;
        weight = 2;
        armor_bonus = 1;
        max_dex_bonus = 2;
        penalty = 0;
        spell_failure = 20;
        description = "The only protection is preventing your hair from burning with the flying candles";
    }

    function warrior_helmet() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint weight,
        uint armor_bonus,
        uint max_dex_bonus,
        int penalty,
        uint spell_failure,
        string memory name,
        string memory description
    ) {
        id = 9;
        name = "Warrior helmet";
        cost = 50e18;
        proficiency = 1;
        weight = 2;
        armor_bonus = 1;
        max_dex_bonus = 2;
        penalty = 0;
        spell_failure = 15;
        description = "Every warrior needs one";
    }

    function metal_glove() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint weight,
        uint armor_bonus,
        uint max_dex_bonus,
        int penalty,
        uint spell_failure,
        string memory name,
        string memory description
    ) {
        id = 10;
        name = "Metal glove";
        cost = 10e18;
        proficiency = 1;
        weight = 2;
        armor_bonus = 1;
        max_dex_bonus = 2;
        penalty = 0;
        spell_failure = 10;
        description = "Perfect to hit, uncomfy to wash your teeth";
    }

    function hero_boots() public pure returns (
        uint id,
        uint cost,
        uint proficiency,
        uint weight,
        uint armor_bonus,
        uint max_dex_bonus,
        int penalty,
        uint spell_failure,
        string memory name,
        string memory description
    ) {
        id = 11;
        name = "Hero boots";
        cost = 15e18;
        proficiency = 1;
        weight = 3;
        armor_bonus = 2;
        max_dex_bonus = 2;
        penalty = 0;
        spell_failure = 10;
        description = "Keeps your feet warm";
    }
}