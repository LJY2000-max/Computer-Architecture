int findClosestNumber(int* nums, int numsSize) {
    int closest_num = nums[0];
    for(int i=0;i<numsSize;i++){
        if(abs(nums[i])<abs(closest_num)){
            closest_num = nums[i];
        }else if(abs(closest_num)==abs(nums[i])){
            if(nums[i]>closest_num){
                closest_num = nums[i];
            }
        }
    }
    return closest_num;
}
