package Group.OOP.Group.OOP.service;

import org.springframework.stereotype.Service;

@Service

public class SleepRate extends CalculateRate {
    @Override
    public float CalculateRate(float rate , float pre , float cur){
        rate = rate * 3;
        if (pre >= 420 && pre < 480) {
            rate -= 5.0f;
        } else if (pre >= 480 && pre < 540) {
            rate -= 2.5f;
        }

        if (cur >= 420 && cur < 480) {
            rate += 5.0f;
        } else if (cur >= 480 && cur < 540) {
            rate += 2.5f;
        }
        rate = rate / 3;
        return rate;
    }
}
