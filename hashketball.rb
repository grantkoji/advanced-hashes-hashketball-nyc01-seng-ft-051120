# Write your code below game_hash

require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(name)
  i = 0
  while i < game_hash[:home][:players].length do
    if name == game_hash[:home][:players][i][:player_name]
      return game_hash[:home][:players][i][:points]
    end
    i += 1
  end
  count = 0
  while count < game_hash[:away][:players].length do
    if name == game_hash[:away][:players][count][:player_name]
      return game_hash[:away][:players][count][:points]
    end
    count += 1
  end
end

def shoe_size(name)
  game_hash[:home][:players].each do |value|
    if name == value[:player_name]
      return value[:shoe]
    end
  end
  game_hash[:away][:players].each do |value|
    if name == value[:player_name]
      return value[:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash.each do |key, value|
    if team_name == value[:team_name]
      return value[:colors]
    end
  end
end

def team_names
  array_teams = []
  game_hash.each do |key, value|
    array_teams << value[:team_name]
  end
  array_teams
end

def player_numbers(team_name)
  array_jerseys = []
  game_hash.each do |key, value|
    if team_name == value[:team_name]
      i = 0
      while i < game_hash[key][:players].length do
        array_jerseys << game_hash[key][:players][i][:number]
        i += 1
      end
    end
  end
  array_jerseys
end

def player_stats(name)
  player_hash = {}
  game_hash.each do |key, value|
    i = 0
      while i < value[:players].length do
        if name == value[:players][i][:player_name]
          value[:players][i].each do |innerkeys, innervalues|
            player_hash[innerkeys] = innervalues
          end
        end
        i += 1
      end
  end
  player_hash
end

def big_shoe_rebounds
  player_w_largest_shoe = "no one"
  player_rebounds = nil
  player_shoe_size = 0
  game_hash.each do |key, value|
    i = 0
    while i < value[:players].length do
      if value[:players][i][:shoe] > player_shoe_size
        player_shoe_size = value[:players][i][:shoe]
        player_w_largest_shoe = value[:players][i][:player_name]
        player_rebounds = value[:players][i][:rebounds]
      end
      i += 1
    end
  end
  player_rebounds
end
