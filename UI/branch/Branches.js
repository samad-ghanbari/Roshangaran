function updateBranches()
{
    branchModel.clear();
    var jsondata = dbMan.getBranchesJson();
    jsondata = JSON.parse(jsondata);
    //id, city, branch_name, address, description
    for(var obj of jsondata)
    {
        branchModel.appendRow({ Id: obj.id, City: obj.city, Name: obj.branch_name, Address: obj.address, Description: obj.description })
    }
}
