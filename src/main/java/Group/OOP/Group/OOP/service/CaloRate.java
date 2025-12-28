package Group.OOP.Group.OOP.service;

import org.springframework.stereotype.Service;

@Service

public class CaloRate extends CalculateRate {

    @Override
    public float CalculateRate(float rate , float pre , float cur){
        rate = rate * 3;
        if (pre > 0 && pre < 500) {
            rate -= 1.5f;
        } else if (pre >= 500 && pre < 1000) {
            rate -= 3.0f;
        } else if (pre >= 1000) {
            rate -= 5.0f;
        }

        if (cur > 0 && cur < 500) {
            rate += 1.5f;
        } else if (cur >= 500 && cur < 1000) {
            rate += 3.0f;
        } else if (cur >= 1000) {
            rate += 5.0f;
        }
        rate = rate / 3;
        return rate;
    }
}
