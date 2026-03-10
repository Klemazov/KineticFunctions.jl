abstract type KF end

struct KFModel{K,F}<:KF
    kmodel::K
    fmodel::F
end

function (kf::KFModel)(temperature,concentration)
    kf.kmodel(temperature)*kf.fmodel(concentration)
end