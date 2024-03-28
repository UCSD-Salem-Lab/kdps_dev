###################################################################################
#
#     Name: ukb_subset_v2.sh 
#
#     Description: Subsets ukb phenotype table based on Data-Field ID's. ID's are found
#               on the UKB website at http://biobank.ndph.ox.ac.uk/showcase/field.cgi?id=104920 
#               Also changes the names of the headers. 
#
#     Usage: bash ukb_subset_v2.sh [Input File] [Output file name and path] 
#
#     Example: bash /salemlab/ukb/PhenoData/ukb_subset_v2.sh inputfile.txt out.txt 
#
#     By: Steven Cao
#
#     Date: October 24th 2019
#
###################################################################################
# Note: Needs a header file in the ukb folder named ukb_header.txt for this script to work.
# Header file can be created by using the head -1  command, and use sed to remove any quotation marks from the header.
# Finally, header file has to be tab delimited!!  
# Also: This script makes a temp file in the current directory labeled by a random number

# Input File:
# A list of Ukbiobank Data field ID's, one per line.
# Separated by a space or tab, the new name after the Data Field ID.

# Example:
################
#543 new_543
#3245 new_3245
#23452 new_23452
#123 new_123
################


# Full paths of ukbio storage
path_ukb="/salemlab/ukb/PhenoData"

# Generate random number to make intermediate temp file for deletion later
rand=$(mktemp)
echo "Temp file generated is named: $rand" 

# Input Parameters
input_file=$1
output_name=$2

# Use Python Script to grab the columns in which Data Field ID's appear
# This value should be comma delimited
col=$(python3 $path_ukb/ukb_subset_helper.py $input_file)

output_arr=()
for i in $(echo $col | tr ";" "\n")
do
  output_arr+=($i)
done

#echo "${output_arr[0]}"
#echo "${output_arr[1]}"

# Check on edge case of having nothing matching except identifier 
if [ ${output_arr[1]} == "1," ]
then
  output_arr[1]="1" 
fi


if [ ${output_arr[0]}  == "none" ]
then
  echo -e
  echo "These are the columns found to be associated with the Data ID in the input file:"
  echo "${output_arr[1]}" 
  echo -e
  echo "All input file Data ID found"
  echo -e
  echo "Generating subsetted table, might take a while"
  zmore $path_ukb/ukb48963_detailed.tab.gz | cut -d$'\t' -f"${output_arr[1]}" > $rand 

else
  echo -e
  echo "These Data ID were not found: ${output_arr[0]}"
  echo -e
  echo "These are the columns found to be associated with the Data ID in the input file:"
  echo "${output_arr[1]}" 
  echo -e
  echo "Generating subsetted table, might take a while"
  zmore $path_ukb/ukb48963_detailed.tab.gz | cut -d$'\t' -f"${output_arr[1]}" > $rand 

fi


##### Part 2: Use Python Pandas to rename table and output again

python3 $path_ukb/ukb_subset_rename.py $rand $output_name $input_file

# Removing intermediate temp file
rm $rand


