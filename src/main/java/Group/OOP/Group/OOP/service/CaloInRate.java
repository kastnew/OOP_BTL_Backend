package Group.OOP.Group.OOP.service;

import org.springframework.stereotype.Service;

@Service
public class CaloInRate extends CalculateRate{

    @Override
    public float CalculateRate(float rate , float pre , float cur){
        rate = rate * 3;
        if (pre >= 700 && pre < 1000) {
            rate -= 5.0f;
        } else if (pre >= 1000 && pre < 1300) {
            rate -= 2.5f;
        }

        if (cur >= 700 && cur < 1000) {
            rate += 5.0f;
        } else if (cur >= 1000 && cur < 1300) {
            rate += 2.5f;
        }
        rate = rate / 3;
        return rate;
    }
}
