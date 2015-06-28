#!/usr/bin/env ruby
require 'csv'
require 'debugger'

csv_in = CSV.read('query_result.csv', headers: true, header_converters: :symbol)

force_type_hash = {
  '1' => 'Lethal Firearm Discharge',
  '2' => 'Force Resulting in Death',
  '3' => 'Force Creating Substantial Risk of Causing Death',
  '4' => 'Intentional Strike to Head w/ Impact Weapon, Regardless of Injury',
  '5' => 'Unintentional Firearm Discharge Regardless of Injury',
  '6' => 'Force Results in SBI (Defined by DGO K-4) Other than Carotid Restraint',
  '7' => 'Carotid Restraint with Loss of Consciousness',
  '8' => 'Other: (Describe in Narrative)',
  '9' => 'Strike to the Head - Other than an Intentional Strike to Head with an Impact Weapon',
  '10' => 'Carotid Restraint without Loss of Consciousness',
  '11' => 'Taser Probes Impact Clothing, Penetrates Skin, or Push Stun',
  '12' => 'Impact/Impromptu Weapon with Contact - Regardless of Injury',
  '13' => 'Any Use of Force Resulting in Injury (Other than a Level 1 Force Type)',
  '14' => 'Police Patrol Canine Bites Clothing, Skin, or Injures a Person',
  '15' => 'Other (Describe in Narrative)',
  '16' => 'Weaponless Defense Technique Other than Control Hold',
  '17' => 'O/C Applied to a Person',
  '17a' => 'Other Chemical Agent Deployed / Applied to a Person',
  '18' => 'Taser Fired but Probes Miss',
  '19' => 'Non-Striking Use of Baton',
  '20' => 'Attempted Impact Weapon Strike, but Misses',
  '21' => 'On-Duty Firearm Discharge at Animal Other than to Dispatch an Injured Animal',
  '22' => 'Intentionally Pointing a Firearm at a Person',
  '23' => 'Weaponless Defense Technique applied to a vulnerable area, excluding strikes (e.g., hair grab, pressure to mastoid, shoulder grab)',
  '24' => 'On-Duty Firearm Discharge to Dispatch an Injured Animal',
  '25' => 'A Weaponless Defense Technique Control Hold is applied: Escort (elbow); Twist lock; Arm-bar; or Bent-wrist.',
  '26' => 'A level 3 use of force incident meeting the criteria to be reported as a Level 4 AND reviewed and approved by supervisor or commander. '
}

CSV.open('test.csv', 'w') do |csv_out|

  csv_out << csv_in.first.headers

  csv_in.each do |row|
    if !row[:force_type].to_s.match(/(26|15)-\S*/)
      if force_type_hash.include?(row[:force_type].to_s)
        #puts 'force type:', force_type_hash[row[:force_type].to_s]
        row[:force_type] = force_type_hash[row[:force_type].to_s]
      end
    else
      two_types = row[:force_type].to_s.split('-')
      row[:force_type] = force_type_hash[two_types[0]] + ' ' + force_type_hash[two_types[1]]
      #puts ['what type of force', row[:force_type]]
    end
    csv_out << row.fields
    nil
  end
end
