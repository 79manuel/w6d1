# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
raise "candidates must be an Array" if @candidates.nil?
  @candidates.each do |candidate|
    return candidate if candidate[:id] == id
  end
  nil
end

def display_all_users(candidates)
candidates.each do |candidate|
  puts candidate
  end
end


def experienced?(candidate)
  unless candidate.has_key?(:years_of_experience)
    raise ArgumentError, 'candidate must have a :years_of_experience key'
  end
  candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
candidates.select do |candidate|
    candidate[:years_of_experience] >= 2 &&
    candidate[:github_points] >= 100 &&
    candidate[:age] >= 18 &&
    (Date.today - candidate[:date_applied]).to_i <= 15 &&
    (candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python"))

  end
end

def ordered_by_qualifications(candidates)
  candidates.sort_by do |candidate|
    [ candidate[:years_of_experience], -candidate[:github_points] ]

  end
end
# More methods will go below
