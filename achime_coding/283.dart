/// Move Zeroes
class Solution {
  void moveZeroes(List<int> nums) {
    int non_zero = 0;
    for (int yes_zero = 0; yes_zero<nums.length; yes_zero++) {
        if (nums[yes_zero] != 0) {
            int temp = nums[non_zero];
            nums[non_zero] = nums[yes_zero];
            nums[yes_zero] = temp;
            non_zero++;
        }
    }
  } 
} 
