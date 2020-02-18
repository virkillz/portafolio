defmodule Portafolio.Masterdata.Selection do
  def bust_size do
    [{"A", 1}, {"B", 2}, {"C", 3}, {"D", 4}, {"DD", 5}]
  end

  def body_size do
    [{"XS", 10}, {"S", 20}, {"M", 30}, {"L", 40}, {"XL", 50}, {"XXL", 60}, {"XXXL", 70}]
  end

  def skin_type do
    ["light", "dark", "tan"]
  end

  def body_type do
    ["petite", "skinny", "slim", "curvy", "fit", "athletic", "muscular", "chubby", "fat"]
  end

  def ethnicity do
    [
      "caucasian",
      "oriental",
      "indo-caucasian",
      "melanesian",
      "mid-eastern",
      "african",
      "indian",
      "malayan",
      "latin-american"
    ]
  end

  def nationality do
    [
      "Indonesia"
    ]
  end

  def eye_color do
    ["blue", "brown", "grey", "hazel", "black", "green"]
  end

  def lip_type do
    ["thin", "full", "wide", "heavy", "shaped"]
  end

  def hair_color do
    ["black", "brown", "brunette", "blonde", "red/ginger", "white", "grey"]
  end

  def hair_type do
    ["curly", "stright", "wavy", "afro"]
  end

  def hair_style do
    ["bald", "short", "very short", "long", "very long"]
  end
end
