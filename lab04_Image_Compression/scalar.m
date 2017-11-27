function S = scalar(QP)
    if QP > 50
        S = (100-QP)/50;
    else 
        S = 50/QP; 
    end
end