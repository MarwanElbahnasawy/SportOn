//
//  MockNetworkService.swift
//  SportOnTests
//
//  Created by Marwan Elbahnasawy on 10/05/2023.
//

import Foundation
@testable import SportOn

class MockNetworkService{
    static let allLeaguesForFootballData = """
{
"success": 1,
"result": [
{
"league_key": 4,
"league_name": "UEFA Europa League",
"country_key": 1,
"country_name": "eurocups",
"league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/",
"country_logo": null
},
{
"league_key": 1,
"league_name": "European Championship",
"country_key": 1,
"country_name": "eurocups",
"league_logo": null,
"country_logo": null
},
{
"league_key": 683,
"league_name": "UEFA Europa Conference League",
"country_key": 1,
"country_name": "eurocups",
"league_logo": null,
"country_logo": null
}
]
}
"""
    
    static let upcomingMatchesForFootballData =
    """
{
"success": 1,
"result": [
{
"event_key": 1216463,
"event_date": "2023-05-17",
"event_time": "21:00",
"event_home_team": "Manchester City",
"home_team_key": 80,
"event_away_team": "Real Madrid",
"away_team_key": 76,
"event_halftime_result": "",
"event_final_result": "-",
"event_ft_result": "",
"event_penalty_result": "",
"event_status": "",
"country_name": "eurocups",
"league_name": "UEFA Champions League - Semi-finals",
"league_key": 3,
"league_round": "Semi-finals",
"league_season": "2022/2023",
"event_live": "0",
"event_stadium": "Etihad Stadium (Manchester)",
"event_referee": "",
"home_team_logo": "https://apiv2.allsportsapi.com/logo/80_manchester-city.jpg",
"away_team_logo": "https://apiv2.allsportsapi.com/logo/76_real-madrid.jpg",
"event_country_key": 1,
"league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png",
"country_logo": null,
"event_home_formation": "",
"event_away_formation": "",
"fk_stage_key": 8,
"stage_name": "Semi-finals",
"league_group": null,
"goalscorers": [],
"substitutes": [],
"cards": [],
"lineups": {
"home_team": {
"starting_lineups": [],
"substitutes": [],
"coaches": [],
"missing_players": []
},
"away_team": {
"starting_lineups": [],
"substitutes": [],
"coaches": [],
"missing_players": []
}
},
"statistics": []
},
{
"event_key": 1216461,
"event_date": "2023-05-16",
"event_time": "21:00",
"event_home_team": "Inter Milan",
"home_team_key": 79,
"event_away_team": "AC Milan",
"away_team_key": 159,
"event_halftime_result": "",
"event_final_result": "-",
"event_ft_result": "",
"event_penalty_result": "",
"event_status": "",
"country_name": "eurocups",
"league_name": "UEFA Champions League - Semi-finals",
"league_key": 3,
"league_round": "Semi-finals",
"league_season": "2022/2023",
"event_live": "0",
"event_stadium": "Stadio Giuseppe Meazza (Milano)",
"event_referee": "",
"home_team_logo": "https://apiv2.allsportsapi.com/logo/79_inter-milan.jpg",
"away_team_logo": "https://apiv2.allsportsapi.com/logo/159_ac-milan.jpg",
"event_country_key": 1,
"league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png",
"country_logo": null,
"event_home_formation": "",
"event_away_formation": "",
"fk_stage_key": 8,
"stage_name": "Semi-finals",
"league_group": null,
"goalscorers": [],
"substitutes": [],
"cards": [],
"lineups": {
"home_team": {
"starting_lineups": [],
"substitutes": [],
"coaches": [],
"missing_players": []
},
"away_team": {
"starting_lineups": [],
"substitutes": [],
"coaches": [],
"missing_players": []
}
},
"statistics": []
}
]
}
"""
    
    static let upcomingMatchesForTennisData =
    """
    {
    "success": 1,
    "result": [
    {
    "event_key": 11862537,
    "event_date": "2023-05-12",
    "event_time": "11:00",
    "event_first_player": "L. Tsurenko",
    "first_player_key": 473,
    "event_second_player": "B. Pera",
    "second_player_key": 518,
    "event_final_result": "-",
    "event_game_result": "-",
    "event_serve": null,
    "event_winner": null,
    "event_status": "1",
    "country_name": "Wta Singles",
    "league_name": "WTA Rome",
    "league_key": 2010,
    "league_round": null,
    "league_season": "2023",
    "event_live": "0",
    "event_first_player_logo": "https://apiv2.allsportsapi.com/logo-tennis/473_l-tsurenko.jpg",
    "event_second_player_logo": "https://apiv2.allsportsapi.com/logo-tennis/518_b-pera.jpg",
    "pointbypoint": [],
    "scores": []
    },
    {
    "event_key": 11862381,
    "event_date": "2023-05-12",
    "event_time": "11:00",
    "event_first_player": "J. Paolini",
    "first_player_key": 2811,
    "event_second_player": "E. Rybakina",
    "second_player_key": 2172,
    "event_final_result": "-",
    "event_game_result": "-",
    "event_serve": null,
    "event_winner": null,
    "event_status": "1",
    "country_name": "Wta Singles",
    "league_name": "WTA Rome",
    "league_key": 2010,
    "league_round": "WTA Rome - 1/32-finals",
    "league_season": "2023",
    "event_live": "0",
    "event_first_player_logo": "https://apiv2.allsportsapi.com/logo-tennis/2811_j-paolini.jpg",
    "event_second_player_logo": "https://apiv2.allsportsapi.com/logo-tennis/2172_e-rybakina.jpg",
    "pointbypoint": [],
    "scores": []
    }
    ]
    }
    """
    
    static let liveMatchesForFootballData =
    """
{
"success": 1,
"result": [
{
"event_key": 1177734,
"event_date": "2023-05-10",
"event_time": "22:30",
"event_home_team": "Cienciano",
"home_team_key": 5739,
"event_away_team": "Alianza Atl.",
"away_team_key": 5745,
"event_halftime_result": "3 - 2",
"event_final_result": "3 - 2",
"event_ft_result": "",
"event_penalty_result": "",
"event_status": "Half Time",
"country_name": "Peru",
"league_name": "Primera División - Apertura",
"league_key": 257,
"league_round": "Round 7",
"league_season": "2023",
"event_live": "1",
"event_stadium": "Estadio Inca Garcilaso de la Vega, Cusco",
"event_referee": "Joel Alarcon, Peru",
"home_team_logo": "https://apiv2.allsportsapi.com/logo/5739_cienciano.jpg",
"away_team_logo": "https://apiv2.allsportsapi.com/logo/5745_alianza-atletico.jpg",
"event_country_key": 90,
"league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/257_primera-división.png",
"country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/90_peru.png",
"event_home_formation": "4-1-4-1",
"event_away_formation": "3-4-3",
"fk_stage_key": 1407,
"stage_name": "Apertura",
"league_group": null,
"goalscorers": [
{
"time": "3",
"home_scorer": "",
"home_scorer_id": "",
"home_assist": "",
"home_assist_id": "",
"score": "0 - 1",
"away_scorer": "A. Fernandez",
"away_scorer_id": "3405013976",
"away_assist": "J. Aguirre",
"away_assist_id": "3253142548",
"info": "",
"info_time": "1st Half"
},
{
"time": "13",
"home_scorer": "C. Garces",
"home_scorer_id": "1370114513",
"home_assist": "I. Santillan",
"home_assist_id": "719776657",
"score": "1 - 1",
"away_scorer": "",
"away_scorer_id": "",
"away_assist": "",
"away_assist_id": "",
"info": "",
"info_time": "1st Half"
},
{
"time": "18",
"home_scorer": "",
"home_scorer_id": "",
"home_assist": "",
"home_assist_id": "",
"score": "1 - 2",
"away_scorer": "A. Fernandez",
"away_scorer_id": "3405013976",
"away_assist": "M. Cornejo",
"away_assist_id": "1955045661",
"info": "",
"info_time": "1st Half"
},
{
"time": "27",
"home_scorer": "C. Garces",
"home_scorer_id": "1370114513",
"home_assist": "",
"home_assist_id": "",
"score": "2 - 2",
"away_scorer": "",
"away_scorer_id": "",
"away_assist": "",
"away_assist_id": "",
"info": "",
"info_time": "1st Half"
},
{
"time": "30",
"home_scorer": "K. Sandoval",
"home_scorer_id": "1915214179",
"home_assist": "J. Romagnoli",
"home_assist_id": "262281618",
"score": "3 - 2",
"away_scorer": "",
"away_scorer_id": "",
"away_assist": "",
"away_assist_id": "",
"info": "",
"info_time": "1st Half"
}
],
"substitutes": [
{
"time": "17",
"home_scorer": [],
"home_assist": "",
"score": "substitution",
"away_scorer": {
"in": "J. A. Mendieta Rojas",
"out": "J. Racchumick",
"in_id": 1693804939,
"out_id": 331697454
},
"away_assist": "",
"info": "",
"info_time": "1st Half"
}
],
"cards": [
{
"time": "16",
"home_fault": "",
"card": "yellow card",
"away_fault": "J. Racchumick",
"info": "",
"home_player_id": "",
"away_player_id": "331697454",
"info_time": "1st Half"
},
{
"time": "20",
"home_fault": "C. Garces",
"card": "yellow card",
"away_fault": "",
"info": "",
"home_player_id": "1370114513",
"away_player_id": "",
"info_time": "1st Half"
},
{
"time": "23",
"home_fault": "",
"card": "yellow card",
"away_fault": "A. Fernandez",
"info": "",
"home_player_id": "",
"away_player_id": "3405013976",
"info_time": "1st Half"
},
{
"time": "40",
"home_fault": "G. Gonzalez",
"card": "yellow card",
"away_fault": "",
"info": "",
"home_player_id": "3994444306",
"away_player_id": "",
"info_time": "1st Half"
},
{
"time": "45+2",
"home_fault": "J. Romagnoli",
"card": "yellow card",
"away_fault": "",
"info": "",
"home_player_id": "262281618",
"away_player_id": "",
"info_time": "1st Half"
}
],
"lineups": {
"home_team": {
"starting_lineups": [
{
"player": "Alberto Quintero",
"player_number": 19,
"player_position": 10,
"player_country": null,
"player_key": 357877834,
"info_time": ""
},
{
"player": "Ayrthon Quintana",
"player_number": 31,
"player_position": 9,
"player_country": null,
"player_key": 1434014409,
"info_time": ""
},
{
"player": "Carlos Beltran",
"player_number": 13,
"player_position": 4,
"player_country": null,
"player_key": 2794105620,
"info_time": ""
},
{
"player": "Carlos Garcés",
"player_number": 21,
"player_position": 11,
"player_country": null,
"player_key": 1370114513,
"info_time": ""
},
{
"player": "Gonzalo González",
"player_number": 33,
"player_position": 6,
"player_country": null,
"player_key": 3994444306,
"info_time": ""
},
{
"player": "Hansell Riojas",
"player_number": 26,
"player_position": 3,
"player_country": null,
"player_key": 939721136,
"info_time": ""
},
{
"player": "Iván Santillán",
"player_number": 16,
"player_position": 5,
"player_country": null,
"player_key": 719776657,
"info_time": ""
},
{
"player": "Juan Romagnoli",
"player_number": 10,
"player_position": 7,
"player_country": null,
"player_key": 262281618,
"info_time": ""
},
{
"player": "Kevin Sandoval",
"player_number": 20,
"player_position": 8,
"player_country": null,
"player_key": 1915214179,
"info_time": ""
},
{
"player": "Luis Garro",
"player_number": 17,
"player_position": 2,
"player_country": null,
"player_key": 2489244999,
"info_time": ""
},
{
"player": "Miguel Vargas",
"player_number": 25,
"player_position": 1,
"player_country": null,
"player_key": 1298360053,
"info_time": ""
}
],
"substitutes": [
{
"player": "Denzel Cana",
"player_number": 23,
"player_position": 0,
"player_country": null,
"player_key": 2578857880,
"info_time": ""
},
{
"player": "Gianlucca Fatecha",
"player_number": 18,
"player_position": 0,
"player_country": null,
"player_key": 3636752988,
"info_time": ""
},
{
"player": "José Leguizamón",
"player_number": 28,
"player_position": 0,
"player_country": null,
"player_key": 1988779509,
"info_time": ""
},
{
"player": "Koichi Aparicio",
"player_number": 3,
"player_position": 0,
"player_country": null,
"player_key": 1776898000,
"info_time": ""
},
{
"player": "Lenin Checco",
"player_number": 32,
"player_position": 0,
"player_country": null,
"player_key": 1264402644,
"info_time": ""
},
{
"player": "Rodrigo Rodriguez",
"player_number": 27,
"player_position": 0,
"player_country": null,
"player_key": 3942354844,
"info_time": ""
},
{
"player": "Sharif Ramírez",
"player_number": 22,
"player_position": 0,
"player_country": null,
"player_key": 4076878508,
"info_time": ""
}
],
"coaches": [
{
"coache": "L. Álvarez",
"coache_country": null
}
],
"missing_players": []
},
"away_team": {
"starting_lineups": [
{
"player": "Adrián Fernández",
"player_number": 9,
"player_position": 10,
"player_country": null,
"player_key": 3405013976,
"info_time": ""
},
{
"player": "Aldair Perleche",
"player_number": 30,
"player_position": 5,
"player_country": null,
"player_key": 2423154802,
"info_time": ""
},
{
"player": "Ángelo Pizzorno",
"player_number": 24,
"player_position": 4,
"player_country": null,
"player_key": 4146896790,
"info_time": ""
},
{
"player": "Diego Melián",
"player_number": 21,
"player_position": 1,
"player_country": null,
"player_key": 3434074303,
"info_time": ""
},
{
"player": "Guillermo Larios",
"player_number": 22,
"player_position": 9,
"player_country": null,
"player_key": 374120798,
"info_time": ""
},
{
"player": "Jeremy Canela",
"player_number": 20,
"player_position": 11,
"player_country": null,
"player_key": 3696140095,
"info_time": ""
},
{
"player": "Joaquín Aguirre",
"player_number": 6,
"player_position": 8,
"player_country": null,
"player_key": 3253142548,
"info_time": ""
},
{
"player": "José Racchumick",
"player_number": 26,
"player_position": 2,
"player_country": null,
"player_key": 331697454,
"info_time": ""
},
{
"player": "Miguel Cornejo",
"player_number": 27,
"player_position": 7,
"player_country": null,
"player_key": 1955045661,
"info_time": ""
},
{
"player": "Piero Serra",
"player_number": 31,
"player_position": 3,
"player_country": null,
"player_key": 3420581097,
"info_time": ""
},
{
"player": "Santiago Arias",
"player_number": 5,
"player_position": 6,
"player_country": null,
"player_key": 2005808570,
"info_time": ""
}
],
"substitutes": [
{
"player": "Emanuel Ibáñez",
"player_number": 25,
"player_position": 0,
"player_country": null,
"player_key": 736029326,
"info_time": ""
},
{
"player": "Federico Nicosia",
"player_number": 1,
"player_position": 0,
"player_country": null,
"player_key": 702239207,
"info_time": ""
},
{
"player": "Flavio Fernández",
"player_number": 17,
"player_position": 0,
"player_country": null,
"player_key": 3752953717,
"info_time": ""
},
{
"player": "Jesus Mendieta",
"player_number": 15,
"player_position": 0,
"player_country": null,
"player_key": 1693804939,
"info_time": ""
},
{
"player": "José Miguel Manzaneda",
"player_number": 77,
"player_position": 0,
"player_country": null,
"player_key": 2591833596,
"info_time": ""
},
{
"player": "Marcos Ortiz",
"player_number": 3,
"player_position": 0,
"player_country": null,
"player_key": 3694056133,
"info_time": ""
},
{
"player": "Mauricio Matzuda",
"player_number": 11,
"player_position": 0,
"player_country": null,
"player_key": 2063796359,
"info_time": ""
},
{
"player": "Róger Torres",
"player_number": 10,
"player_position": 0,
"player_country": null,
"player_key": 412487739,
"info_time": ""
},
{
"player": "Santiago Rebagliati",
"player_number": 18,
"player_position": 0,
"player_country": null,
"player_key": 1066223888,
"info_time": ""
}
],
"coaches": [
{
"coache": "C. Desio",
"coache_country": null
}
],
"missing_players": []
}
},
"statistics": [
{
"type": "Substitution",
"home": "0",
"away": "1"
},
{
"type": "Attacks",
"home": "50",
"away": "28"
},
{
"type": "Dangerous Attacks",
"home": "13",
"away": "6"
},
{
"type": "On Target",
"home": "5",
"away": "7"
},
{
"type": "Off Target",
"home": "4",
"away": "2"
},
{
"type": "Shots Total",
"home": "8",
"away": "9"
},
{
"type": "Shots On Goal",
"home": "5",
"away": "7"
},
{
"type": "Shots Off Goal",
"home": "2",
"away": "2"
},
{
"type": "Shots Blocked",
"home": "1",
"away": "0"
},
{
"type": "Shots Inside Box",
"home": "3",
"away": "3"
},
{
"type": "Shots Outside Box",
"home": "5",
"away": "6"
},
{
"type": "Fouls",
"home": "4",
"away": "4"
},
{
"type": "Corners",
"home": "4",
"away": "1"
},
{
"type": "Offsides",
"home": "1",
"away": "1"
},
{
"type": "Ball Possession",
"home": "71%",
"away": "29%"
},
{
"type": "Yellow Cards",
"home": "2",
"away": "2"
},
{
"type": "Saves",
"home": "5",
"away": "2"
},
{
"type": "Passes Total",
"home": "230",
"away": "95"
},
{
"type": "Passes Accurate",
"home": "205",
"away": "73"
}
]
}
]
}
"""
    
    static let liveMatchesForTennisData =
"""
    {
    "success": 1,
    "result": [
    {
    "event_key": 11862272,
    "event_date": "2023-05-10",
    "event_time": "22:05",
    "event_first_player": "P. Badosa",
    "first_player_key": 2178,
    "event_second_player": "A-L. Friedsam",
    "second_player_key": 522,
    "event_final_result": "1 - 1",
    "event_game_result": "15 - 15",
    "event_serve": "Second Player",
    "event_winner": null,
    "event_status": "Set 3",
    "country_name": "Wta Singles",
    "league_name": "WTA Rome",
    "league_key": 2010,
    "league_round": "WTA Rome - 1/64-finals",
    "league_season": "2023",
    "event_live": "1",
    "event_first_player_logo": null,
    "event_second_player_logo": "https://apiv2.allsportsapi.com/logo-tennis/522_a-l-friedsam.jpg",
    "pointbypoint": [
    {
    "set_number": "Set 1",
    "number_game": "1",
    "player_served": "Second Player",
    "serve_winner": "First Player",
    "serve_lost": "Second Player",
    "score": "1 - 0",
    "points": [
    {
    "number_point": "1",
    "score": "15 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "30 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "40 - 0",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "40 - 15",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 1",
    "number_game": "2",
    "player_served": "First Player",
    "serve_winner": "First Player",
    "serve_lost": null,
    "score": "2 - 0",
    "points": [
    {
    "number_point": "1",
    "score": "0 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "15 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "30 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "40 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "40 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 1",
    "number_game": "3",
    "player_served": "Second Player",
    "serve_winner": "Second Player",
    "serve_lost": null,
    "score": "2 - 1",
    "points": [
    {
    "number_point": "1",
    "score": "0 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "0 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "0 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 1",
    "number_game": "4",
    "player_served": "First Player",
    "serve_winner": "Second Player",
    "serve_lost": "First Player",
    "score": "2 - 2",
    "points": [
    {
    "number_point": "1",
    "score": "15 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "30 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "40 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "40 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "40 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "6",
    "score": "40 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "7",
    "score": "40 - A",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "8",
    "score": "40 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "9",
    "score": "40 - A",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 1",
    "number_game": "5",
    "player_served": "Second Player",
    "serve_winner": "Second Player",
    "serve_lost": null,
    "score": "2 - 3",
    "points": [
    {
    "number_point": "1",
    "score": "15 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "15 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "15 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "30 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "40 - 30",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "6",
    "score": "40 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "7",
    "score": "40 - A",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 1",
    "number_game": "6",
    "player_served": "First Player",
    "serve_winner": "First Player",
    "serve_lost": null,
    "score": "3 - 3",
    "points": [
    {
    "number_point": "1",
    "score": "15 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "30 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "40 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "40 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 1",
    "number_game": "7",
    "player_served": "Second Player",
    "serve_winner": "Second Player",
    "serve_lost": null,
    "score": "3 - 4",
    "points": [
    {
    "number_point": "1",
    "score": "0 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "0 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "0 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 1",
    "number_game": "8",
    "player_served": "First Player",
    "serve_winner": "First Player",
    "serve_lost": null,
    "score": "4 - 4",
    "points": [
    {
    "number_point": "1",
    "score": "15 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "30 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "30 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "30 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "40 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 1",
    "number_game": "9",
    "player_served": "Second Player",
    "serve_winner": "Second Player",
    "serve_lost": null,
    "score": "4 - 5",
    "points": [
    {
    "number_point": "1",
    "score": "0 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "0 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "0 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "15 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "30 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 1",
    "number_game": "10",
    "player_served": "First Player",
    "serve_winner": "Second Player",
    "serve_lost": "First Player",
    "score": "4 - 6",
    "points": [
    {
    "number_point": "1",
    "score": "15 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "15 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "15 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "30 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "30 - 40",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "6",
    "score": "40 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "7",
    "score": "A - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "8",
    "score": "40 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "9",
    "score": "40 - A",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 2",
    "number_game": "1",
    "player_served": "Second Player",
    "serve_winner": "First Player",
    "serve_lost": "Second Player",
    "score": "1 - 0",
    "points": [
    {
    "number_point": "1",
    "score": "15 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "30 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "30 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "40 - 15",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "40 - 30",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 2",
    "number_game": "2",
    "player_served": "First Player",
    "serve_winner": "First Player",
    "serve_lost": null,
    "score": "2 - 0",
    "points": [
    {
    "number_point": "1",
    "score": "15 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "30 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "40 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "40 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 2",
    "number_game": "3",
    "player_served": "Second Player",
    "serve_winner": "First Player",
    "serve_lost": "Second Player",
    "score": "3 - 0",
    "points": [
    {
    "number_point": "1",
    "score": "0 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "0 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "15 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "30 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "30 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "6",
    "score": "40 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "7",
    "score": "40 - A",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "8",
    "score": "40 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "9",
    "score": "A - 40",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 2",
    "number_game": "4",
    "player_served": "First Player",
    "serve_winner": "Second Player",
    "serve_lost": "First Player",
    "score": "3 - 1",
    "points": [
    {
    "number_point": "1",
    "score": "0 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "0 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "15 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "30 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "30 - 40",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "6",
    "score": "40 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "7",
    "score": "40 - A",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 2",
    "number_game": "5",
    "player_served": "Second Player",
    "serve_winner": "First Player",
    "serve_lost": "Second Player",
    "score": "4 - 1",
    "points": [
    {
    "number_point": "1",
    "score": "0 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "15 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "15 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "30 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "40 - 30",
    "break_point": "First Play",
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 2",
    "number_game": "6",
    "player_served": "First Player",
    "serve_winner": "First Player",
    "serve_lost": null,
    "score": "5 - 1",
    "points": [
    {
    "number_point": "1",
    "score": "15 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "30 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "30 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "40 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 2",
    "number_game": "7",
    "player_served": "Second Player",
    "serve_winner": "Second Player",
    "serve_lost": null,
    "score": "5 - 2",
    "points": [
    {
    "number_point": "1",
    "score": "0 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "15 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "15 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "15 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "30 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 2",
    "number_game": "8",
    "player_served": "First Player",
    "serve_winner": "First Player",
    "serve_lost": null,
    "score": "6 - 2",
    "points": [
    {
    "number_point": "1",
    "score": "15 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "30 - 0",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "30 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "40 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    },
    {
    "set_number": "Set 3",
    "number_game": "1",
    "player_served": "Second Player",
    "serve_winner": "Second Player",
    "serve_lost": null,
    "score": "0 - 1",
    "points": [
    {
    "number_point": "1",
    "score": "0 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "2",
    "score": "15 - 15",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "3",
    "score": "15 - 30",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "4",
    "score": "15 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    },
    {
    "number_point": "5",
    "score": "30 - 40",
    "break_point": null,
    "set_point": null,
    "match_point": null
    }
    ]
    }
    ],
    "scores": [
    {
    "score_first": "4",
    "score_second": "6",
    "score_set": "1"
    },
    {
    "score_first": "6",
    "score_second": "2",
    "score_set": "2"
    },
    {
    "score_first": "1",
    "score_second": "1",
    "score_set": "3"
    }
    ]
    }
    ]
    }
    """
    
    static let teamsForFootballMatch =
    """
{
"success": 1,
"result": [
{
"team_key": 557,
"team_name": "Deportivo Binacional",
"team_logo": "https://apiv2.allsportsapi.com/logo/557_deportivo-binacional.jpg",
"players": [
{
"player_key": 380249070,
"player_name": "D. Enríquez",
"player_number": "1",
"player_country": null,
"player_type": "Goalkeepers",
"player_age": "21",
"player_match_played": "10",
"player_goals": "0",
"player_yellow_cards": "3",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/126858_d-enriquez.jpg"
},
{
"player_key": 3668447742,
"player_name": "Á. Azurín",
"player_number": "21",
"player_country": null,
"player_type": "Goalkeepers",
"player_age": "31",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/15633_a-azurin.jpg"
},
{
"player_key": 699045664,
"player_name": "J. Escalante",
"player_number": "",
"player_country": null,
"player_type": "Goalkeepers",
"player_age": "21",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": null
},
{
"player_key": 3767140000,
"player_name": "G. Villamayor",
"player_number": "3",
"player_country": null,
"player_type": "Defenders",
"player_age": "30",
"player_match_played": "1",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/39671_g-villamayor.jpg"
},
{
"player_key": 1401581065,
"player_name": "Y. Murillo",
"player_number": "5",
"player_country": null,
"player_type": "Defenders",
"player_age": "30",
"player_match_played": "10",
"player_goals": "1",
"player_yellow_cards": "2",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/15115_y-murillo.jpg"
},
{
"player_key": 4067269256,
"player_name": "B. Ampuero",
"player_number": "11",
"player_country": null,
"player_type": "Defenders",
"player_age": "22",
"player_match_played": "1",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/126367_b-ampuero.jpg"
},
{
"player_key": 3924662346,
"player_name": "M. Quina",
"player_number": "14",
"player_country": null,
"player_type": "Defenders",
"player_age": "35",
"player_match_played": "2",
"player_goals": "0",
"player_yellow_cards": "1",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/3595_m-quina.jpg"
},
{
"player_key": 1862613260,
"player_name": "B. Villalta",
"player_number": "15",
"player_country": null,
"player_type": "Defenders",
"player_age": "22",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/79413_b-villalta.jpg"
},
{
"player_key": 4208765740,
"player_name": "R. Villamarín",
"player_number": "16",
"player_country": null,
"player_type": "Defenders",
"player_age": "26",
"player_match_played": "7",
"player_goals": "0",
"player_yellow_cards": "2",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/70749_r-villamarin.jpg"
},
{
"player_key": 494708075,
"player_name": "O. Núñez",
"player_number": "18",
"player_country": null,
"player_type": "Defenders",
"player_age": "23",
"player_match_played": "7",
"player_goals": "0",
"player_yellow_cards": "1",
"player_red_cards": "1",
"player_image": "https://apiv2.allsportsapi.com/logo/players/102005_o-nunez.jpg"
},
{
"player_key": 3353646008,
"player_name": "A. Rosell",
"player_number": "25",
"player_country": null,
"player_type": "Defenders",
"player_age": "28",
"player_match_played": "8",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/46415_a-rosell.jpg"
},
{
"player_key": 697843275,
"player_name": "B. Ríos",
"player_number": "26",
"player_country": null,
"player_type": "Defenders",
"player_age": "22",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/101997_b-rios.jpg"
},
{
"player_key": 3657252436,
"player_name": "S. Mena",
"player_number": "30",
"player_country": null,
"player_type": "Defenders",
"player_age": "28",
"player_match_played": "9",
"player_goals": "0",
"player_yellow_cards": "3",
"player_red_cards": "0",
"player_image": null
},
{
"player_key": 1409168850,
"player_name": "Á. Romero",
"player_number": "4",
"player_country": null,
"player_type": "Midfielders",
"player_age": "32",
"player_match_played": "9",
"player_goals": "0",
"player_yellow_cards": "2",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/6640_a-romero.jpg"
},
{
"player_key": 1130664483,
"player_name": "E. Aubert",
"player_number": "7",
"player_country": null,
"player_type": "Midfielders",
"player_age": "34",
"player_match_played": "9",
"player_goals": "0",
"player_yellow_cards": "3",
"player_red_cards": "1",
"player_image": "https://apiv2.allsportsapi.com/logo/players/24966_e-aubert.jpg"
},
{
"player_key": 797829239,
"player_name": "A. Polar",
"player_number": "10",
"player_country": null,
"player_type": "Midfielders",
"player_age": "26",
"player_match_played": "10",
"player_goals": "4",
"player_yellow_cards": "1",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/93673_a-polar.jpg"
},
{
"player_key": 1723036967,
"player_name": "F. Oncoy",
"player_number": "13",
"player_country": null,
"player_type": "Midfielders",
"player_age": "22",
"player_match_played": "9",
"player_goals": "3",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/79415_f-oncoy.jpg"
},
{
"player_key": 1297437783,
"player_name": "B. Palacios",
"player_number": "17",
"player_country": null,
"player_type": "Midfielders",
"player_age": "25",
"player_match_played": "8",
"player_goals": "3",
"player_yellow_cards": "2",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/95855_b-palacios.jpg"
},
{
"player_key": 631805314,
"player_name": "H. Crespo",
"player_number": "20",
"player_country": null,
"player_type": "Midfielders",
"player_age": "31",
"player_match_played": "2",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/165273_h-crespo.jpg"
},
{
"player_key": 3938214654,
"player_name": "J. Vizcarra",
"player_number": "22",
"player_country": null,
"player_type": "Midfielders",
"player_age": "20",
"player_match_played": "5",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": null
},
{
"player_key": 3535665315,
"player_name": "J. Revilla",
"player_number": "24",
"player_country": null,
"player_type": "Midfielders",
"player_age": "18",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": null
},
{
"player_key": 583265708,
"player_name": "J. Durán",
"player_number": "28",
"player_country": null,
"player_type": "Midfielders",
"player_age": "31",
"player_match_played": "9",
"player_goals": "0",
"player_yellow_cards": "2",
"player_red_cards": "1",
"player_image": "https://apiv2.allsportsapi.com/logo/players/11606_j-duran.jpg"
},
{
"player_key": 1546208843,
"player_name": "J. Kouffaty",
"player_number": "8",
"player_country": null,
"player_type": "Forwards",
"player_age": "29",
"player_match_played": "5",
"player_goals": "0",
"player_yellow_cards": "2",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/6374_j-kouffaty.jpg"
},
{
"player_key": 3558416983,
"player_name": "B. Fernández",
"player_number": "9",
"player_country": null,
"player_type": "Forwards",
"player_age": "31",
"player_match_played": "9",
"player_goals": "5",
"player_yellow_cards": "2",
"player_red_cards": "1",
"player_image": "https://apiv2.allsportsapi.com/logo/players/13390_b-fernandez.jpg"
},
{
"player_key": 172430276,
"player_name": "H. Zeta",
"player_number": "19",
"player_country": null,
"player_type": "Forwards",
"player_age": "28",
"player_match_played": "7",
"player_goals": "0",
"player_yellow_cards": "1",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/33867_h-zeta.jpg"
},
{
"player_key": 1935713468,
"player_name": "J. Cáceres",
"player_number": "23",
"player_country": null,
"player_type": "Forwards",
"player_age": "20",
"player_match_played": "9",
"player_goals": "1",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/118469_j-caceres.jpg"
},
{
"player_key": 291054110,
"player_name": "J. Cirilo",
"player_number": "27",
"player_country": null,
"player_type": "Forwards",
"player_age": "24",
"player_match_played": "1",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/106306_j-cirilo.jpg"
}
],
"coaches": [
{
"coach_name": "D. Franco",
"coach_country": null,
"coach_age": null
}
]
}
]
}
"""
    
    static let teamDetailsForFootballData =
"""
{
"success": 1,
"result": [
{
"team_key": 96,
"team_name": "Juventus",
"team_logo": "https://apiv2.allsportsapi.com/logo/96_juventus.jpg",
"players": [
{
"player_key": 3932445726,
"player_name": "W. Szczęsny",
"player_number": "1",
"player_country": null,
"player_type": "Goalkeepers",
"player_age": "33",
"player_match_played": "24",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/10227_w-szczsny.jpg"
},
{
"player_key": 1136721488,
"player_name": "C. Pinsoglio",
"player_number": "23",
"player_country": null,
"player_type": "Goalkeepers",
"player_age": "33",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124198_c-pinsoglio.jpg"
},
{
"player_key": 41841276,
"player_name": "M. Perin",
"player_number": "36",
"player_country": null,
"player_type": "Goalkeepers",
"player_age": "30",
"player_match_played": "10",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/472_m-perin.jpg"
},
{
"player_key": 600699875,
"player_name": "G. Garofani",
"player_number": "41",
"player_country": null,
"player_type": "Goalkeepers",
"player_age": "20",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124214_g-garofani.jpg"
},
{
"player_key": 671816971,
"player_name": "S. Scaglia",
"player_number": "47",
"player_country": null,
"player_type": "Goalkeepers",
"player_age": "18",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/145118_s-scaglia.jpg"
},
{
"player_key": 3104825088,
"player_name": "G. Crespi",
"player_number": "",
"player_country": null,
"player_type": "Goalkeepers",
"player_age": "21",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/114534_g-crespi.jpg"
},
{
"player_key": 2522601687,
"player_name": "M. De Sciglio",
"player_number": "2",
"player_country": null,
"player_type": "Defenders",
"player_age": "30",
"player_match_played": "17",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/9637_m-de-sciglio.jpg"
},
{
"player_key": 1178166642,
"player_name": "Bremer",
"player_number": "3",
"player_country": null,
"player_type": "Defenders",
"player_age": "26",
"player_match_played": "27",
"player_goals": "3",
"player_yellow_cards": "6",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/75436_bremer.jpg"
},
{
"player_key": 2877711449,
"player_name": "Danilo",
"player_number": "6",
"player_country": null,
"player_type": "Defenders",
"player_age": "31",
"player_match_played": "33",
"player_goals": "3",
"player_yellow_cards": "4",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124190_danilo.jpg"
},
{
"player_key": 3671506270,
"player_name": "Alex Sandro",
"player_number": "12",
"player_country": null,
"player_type": "Defenders",
"player_age": "32",
"player_match_played": "23",
"player_goals": "0",
"player_yellow_cards": "5",
"player_red_cards": "1",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124191_alex-sandro.jpg"
},
{
"player_key": 2955446089,
"player_name": "F. Gatti",
"player_number": "15",
"player_country": null,
"player_type": "Defenders",
"player_age": "24",
"player_match_played": "14",
"player_goals": "0",
"player_yellow_cards": "3",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/105549_f-gatti.jpg"
},
{
"player_key": 660766320,
"player_name": "L. Bonucci",
"player_number": "19",
"player_country": null,
"player_type": "Defenders",
"player_age": "36",
"player_match_played": "14",
"player_goals": "1",
"player_yellow_cards": "2",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/55775_l-bonucci.jpg"
},
{
"player_key": 1979491368,
"player_name": "D. Rugani",
"player_number": "24",
"player_country": null,
"player_type": "Defenders",
"player_age": "28",
"player_match_played": "6",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/10670_d-rugani.jpg"
},
{
"player_key": 2461886560,
"player_name": "T. Barbieri",
"player_number": "42",
"player_country": null,
"player_type": "Defenders",
"player_age": "20",
"player_match_played": "1",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124213_t-barbieri.jpg"
},
{
"player_key": 2605052309,
"player_name": "A. Riccio",
"player_number": "51",
"player_country": null,
"player_type": "Defenders",
"player_age": "21",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124203_a-riccio.jpg"
},
{
"player_key": 907728422,
"player_name": "D. Huijsen",
"player_number": "",
"player_country": null,
"player_type": "Defenders",
"player_age": "18",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/221931_d-huijsen.jpg"
},
{
"player_key": 2512750030,
"player_name": "M. Locatelli",
"player_number": "5",
"player_country": null,
"player_type": "Midfielders",
"player_age": "25",
"player_match_played": "28",
"player_goals": "0",
"player_yellow_cards": "8",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/42183_m-locatelli.jpg"
},
{
"player_key": 3501354678,
"player_name": "P. Pogba",
"player_number": "10",
"player_country": null,
"player_type": "Midfielders",
"player_age": "30",
"player_match_played": "4",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/13379_p-pogba.jpg"
},
{
"player_key": 1683987380,
"player_name": "J. Cuadrado",
"player_number": "11",
"player_country": null,
"player_type": "Midfielders",
"player_age": "34",
"player_match_played": "27",
"player_goals": "1",
"player_yellow_cards": "4",
"player_red_cards": "1",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124185_j-cuadrado.jpg"
},
{
"player_key": 1239049347,
"player_name": "F. Kostić",
"player_number": "17",
"player_country": null,
"player_type": "Midfielders",
"player_age": "30",
"player_match_played": "33",
"player_goals": "3",
"player_yellow_cards": "3",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/6957_f-kosti.jpg"
},
{
"player_key": 700266288,
"player_name": "F. Miretti",
"player_number": "20",
"player_country": null,
"player_type": "Midfielders",
"player_age": "19",
"player_match_played": "25",
"player_goals": "0",
"player_yellow_cards": "2",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124218_f-miretti.jpg"
},
{
"player_key": 1652674065,
"player_name": "Á. Di María",
"player_number": "22",
"player_country": null,
"player_type": "Midfielders",
"player_age": "35",
"player_match_played": "21",
"player_goals": "4",
"player_yellow_cards": "1",
"player_red_cards": "1",
"player_image": "https://apiv2.allsportsapi.com/logo/players/11332_a-di-maria.jpg"
},
{
"player_key": 1992946583,
"player_name": "A. Rabiot",
"player_number": "25",
"player_country": null,
"player_type": "Midfielders",
"player_age": "28",
"player_match_played": "27",
"player_goals": "8",
"player_yellow_cards": "7",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/25468_a-rabiot.jpg"
},
{
"player_key": 4265859702,
"player_name": "M. Soulé",
"player_number": "30",
"player_country": null,
"player_type": "Midfielders",
"player_age": "20",
"player_match_played": "13",
"player_goals": "1",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/138952_m-soule.jpg"
},
{
"player_key": 927056414,
"player_name": "L. Paredes",
"player_number": "32",
"player_country": null,
"player_type": "Midfielders",
"player_age": "28",
"player_match_played": "21",
"player_goals": "1",
"player_yellow_cards": "5",
"player_red_cards": "1",
"player_image": "https://apiv2.allsportsapi.com/logo/players/10910_l-paredes.jpg"
},
{
"player_key": 1646853979,
"player_name": "N. Sekulov",
"player_number": "39",
"player_country": null,
"player_type": "Midfielders",
"player_age": "21",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/90757_n-sekulov.jpg"
},
{
"player_key": 1246717351,
"player_name": "N. Fagioli",
"player_number": "44",
"player_country": null,
"player_type": "Midfielders",
"player_age": "22",
"player_match_played": "24",
"player_goals": "2",
"player_yellow_cards": "3",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/88932_n-fagioli.jpg"
},
{
"player_key": 4042587242,
"player_name": "E. Barrenechea",
"player_number": "45",
"player_country": null,
"player_type": "Midfielders",
"player_age": "21",
"player_match_played": "3",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124222_e-barrenechea.jpg"
},
{
"player_key": 1183310237,
"player_name": "M. Compagnon",
"player_number": "46",
"player_country": null,
"player_type": "Midfielders",
"player_age": "21",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124224_m-compagnon.jpg"
},
{
"player_key": 2573209329,
"player_name": "M. Ihattaren",
"player_number": "",
"player_country": null,
"player_type": "Midfielders",
"player_age": "21",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/93008_m-ihattaren.jpg"
},
{
"player_key": 116899296,
"player_name": "J. Nonge Boende",
"player_number": "",
"player_country": null,
"player_type": "Midfielders",
"player_age": "17",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/221929_j-nonge-boende.jpg"
},
{
"player_key": 3039472724,
"player_name": "A. Sersanti",
"player_number": "",
"player_country": null,
"player_type": "Midfielders",
"player_age": "21",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124207_a-sersanti.jpg"
},
{
"player_key": 229082468,
"player_name": "F. Chiesa",
"player_number": "7",
"player_country": null,
"player_type": "Forwards",
"player_age": "25",
"player_match_played": "16",
"player_goals": "0",
"player_yellow_cards": "2",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/72210_f-chiesa.jpg"
},
{
"player_key": 841107665,
"player_name": "D. Vlahović",
"player_number": "9",
"player_country": null,
"player_type": "Forwards",
"player_age": "23",
"player_match_played": "24",
"player_goals": "9",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/67013_d-vlahovi.jpg"
},
{
"player_key": 622912986,
"player_name": "A. Milik",
"player_number": "14",
"player_country": null,
"player_type": "Forwards",
"player_age": "29",
"player_match_played": "22",
"player_goals": "7",
"player_yellow_cards": "2",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/17332_a-milik.jpg"
},
{
"player_key": 2149669217,
"player_name": "M. Kean",
"player_number": "18",
"player_country": null,
"player_type": "Forwards",
"player_age": "23",
"player_match_played": "24",
"player_goals": "6",
"player_yellow_cards": "5",
"player_red_cards": "1",
"player_image": "https://apiv2.allsportsapi.com/logo/players/64992_m-kean.jpg"
},
{
"player_key": 963015647,
"player_name": "Kaio Jorge",
"player_number": "21",
"player_country": null,
"player_type": "Forwards",
"player_age": "21",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124183_kaio-jorge.jpg"
},
{
"player_key": 3118830220,
"player_name": "M. Da Graca",
"player_number": "40",
"player_country": null,
"player_type": "Forwards",
"player_age": "21",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124221_m-da-graca.jpg"
},
{
"player_key": 3758849426,
"player_name": "S. Iling-Junior",
"player_number": "43",
"player_country": null,
"player_type": "Forwards",
"player_age": "19",
"player_match_played": "8",
"player_goals": "0",
"player_yellow_cards": "1",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/124209_s-iling-junior.jpg"
},
{
"player_key": 2715588246,
"player_name": "S. Mbangula",
"player_number": "",
"player_country": null,
"player_type": "Forwards",
"player_age": "19",
"player_match_played": "0",
"player_goals": "0",
"player_yellow_cards": "0",
"player_red_cards": "0",
"player_image": "https://apiv2.allsportsapi.com/logo/players/221928_s-mbangula.jpg"
}
],
"coaches": [
{
"coach_name": "M. Allegri",
"coach_country": null,
"coach_age": null
}
]
}
]
}
"""
}
