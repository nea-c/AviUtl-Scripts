local path = obj.getinfo "script_path" .. "マルチベジエ軌道.data"
print(path)
return {
    get = function(n)
        local file = io.open(path, "r")
        if (file == nil) then
            print("failed to read data")
            return
        end
        local n_, num, ac, b, s, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
            a20, a21, a22, a23, a24, a25, a26, a27, a28
        while (true) do
            n_, num, ac, b, s, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28 =
                file:read("*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n",
                    "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n",
                    "*n", "*n")
            if (n_ == nil or n_ == n) then
                break
            end
        end
        file:close()
        return num, ac, b, s,
            {a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23,
             a24, a25, a26, a27, a28}
    end,
    set = function(n, num, ac, b, s, pAtr)
        local data = {
            [n] = {num, ac, b, s, pAtr[1], pAtr[2], pAtr[3], pAtr[4], pAtr[5], pAtr[6], pAtr[7], pAtr[8], pAtr[9],
                   pAtr[10], pAtr[11], pAtr[12], pAtr[13], pAtr[14], pAtr[15], pAtr[16], pAtr[17], pAtr[18], pAtr[19],
                   pAtr[20], pAtr[21], pAtr[22], pAtr[23], pAtr[24], pAtr[25], pAtr[26], pAtr[27], pAtr[28]}
        }
        local file = io.open(path, "r")
        if (file == nil) then
            print("failed to read data")
        elseif (n ~= 0) then
            while (true) do
                local n_, num_, ac_, b_, s_, a1_, a2_, a3_, a4_, a5_, a6_, a7_, a8_, a9_, a10_, a11_, a12_, a13_, a14_,
                    a15_, a16_, a17_, a18_, a19_, a20_, a21_, a22_, a23_, a24_, a25_, a26_, a27_, a28_ = file:read("*n",
                    "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n",
                    "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n")
                if (n_ == nil) then
                    break
                end
                if (n_ ~= n) then
                    data[n_] = {num_, ac_, b_, s_, a1_, a2_, a3_, a4_, a5_, a6_, a7_, a8_, a9_, a10_, a11_, a12_, a13_,
                                a14_, a15_, a16_, a17_, a18_, a19_, a20_, a21_, a22_, a23_, a24_, a25_, a26_, a27_, a28_}
                end
            end
            file:close()
        end
        local file = io.open(path, "w+")
        for k, v in pairs(data) do
            file:write(string.format("%s %s\n", k, table.concat(v, " ")))
        end
        file:close()
    end,
    remove = function(n)
        local data = {
            [0] = {}
        }
        local file = io.open(path, "r")
        if (file == nil) then
            print("failed to read data")
        elseif (n ~= 0) then
            while (true) do
                local n_, num_, ac_, b_, s_, a1_, a2_, a3_, a4_, a5_, a6_, a7_, a8_, a9_, a10_, a11_, a12_, a13_, a14_,
                    a15_, a16_, a17_, a18_, a19_, a20_, a21_, a22_, a23_, a24_, a25_, a26_, a27_, a28_ = file:read("*n",
                    "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n",
                    "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n", "*n")
                if (n_ == nil) then
                    break
                end
                if (n_ ~= n) then
                    data[n_] = {num_, ac_, b_, s_, a1_, a2_, a3_, a4_, a5_, a6_, a7_, a8_, a9_, a10_, a11_, a12_, a13_,
                                a14_, a15_, a16_, a17_, a18_, a19_, a20_, a21_, a22_, a23_, a24_, a25_, a26_, a27_, a28_}
                end
            end
            file:close()
        end
        local file = io.open(path, "w+")
        for k, v in pairs(data) do
            if (k ~= 0) then
                file:write(string.format("%s %s\n", k, table.concat(v, " ")))
            end
        end
        file:close()
    end,
    reset = function()
        local file = io.open(path, "w+")
        file:write(string.format(""))
        file:close()
    end,
    calc = function(num, ACCURACY, B, S, pA)
        local function clampm(x,min,max) return (x<=min and min) or (x>=max and max) or x end
        S = S / 2

        for i = 1, #pA do
            if (pA[i] == -1) then
                pA[i] = nil
            else
                pA[i] = pA[i] - S
            end
        end

        if (B == 3) then
            num = math.min(5, num)
        end

        -- 点毎にまとめてわかりやすく？する
        local p = {}
        for i = 1, #pA / 2 do
            p[i] = {clampm((pA[i * 2 - 1]), -S, S), pA[i * 2]}
        end

        -- 始点と終点を追加
        p[0] = {-S, S}
        p[#p + 1] = {S, -S}

        -- アンカーの位置入れ替え
        if (B == 2) then
            for i = B, #p - B, B do
                for j = i, #p - B, B do
                    if (p[i][1] > p[j][1]) then
                        p[i], p[j] = p[j], p[i]
                    end
                end
            end
        else
            for i = B, #p - B, B do
                for j = i + 3, #p - B, B do
                    if (p[i][1] >= p[j][1]) then
                        p[i], p[j] = p[j], p[i]
                    end
                end
            end
        end

        -- ハンドルの位置制限
        if (B == 2) then
            for i = 0, #p - B, B do
                if (p[i + 1][1] < p[i][1]) then
                    p[i + 1][1] = p[i][1]
                end
                if (p[i + 1][1] > p[i + 2][1]) then
                    p[i + 1][1] = p[i + 2][1]
                end
            end
        elseif (B == 3) then
            for i = 0, #p - B, B do
                if (p[i + 1][1] < p[i][1]) then
                    p[i + 1][1] = p[i][1]
                end
                if (p[i][1] > p[i + 2][1]) then
                    p[i + 2][1] = p[i][1]
                end
                if (p[i + 1][1] > p[i + 3][1]) then
                    p[i + 1][1] = p[i + 3][1]
                end
                if (p[i + 2][1] > p[i + 3][1]) then
                    p[i + 2][1] = p[i + 3][1]
                end
            end
        end

        -------------------------------------------------------------------------------
        -- 正規化
        local pn = {}
        pn[0] = {0, 0}
        for i = 1, #p do
            pn[i] = {(S + p[i][1]) / (S * 2), 1 - ((S + p[i][2]) / (S * 2)) -- yは反転
            }
        end
        local BezierX
        -- 正規化時、アンカー毎にオフセット＆スケールで制御点だけにできそうです
        if (B == 2) then
            BezierX = function(t, x0, x1, x2)
                local k = (1 - t)
                -- return (x1*2*t)*k + t*t
                return (x0 * k + x1 * 2 * t) * k + x2 * t * t
            end
        else
            BezierX = function(t, x0, x1, x2, x3)
                local k = 1 - t
                -- return ((x1*k + x2*t)*3*t)*k + t*t*t
                return (x0 * k * k + (x1 * k + x2 * t) * 3 * t) * k + x3 * t * t * t
            end
        end

        local Time = {}
        Time[0] = 0
        Time[ACCURACY] = 1

        for i = 1, ACCURACY - 1 do
            local t = i / ACCURACY

            -- tと対応するカーブの始点kを探す
            local k = 0
            for j = 0, #pn - B, B do
                if (t > pn[j][1]) and (t <= pn[j + B][1]) then
                    k = j
                end
            end

            -- Bisection method
            local p3 = pn[k + 3] or {} -- Quadだとフィールドが無いので
            local t_min = 0
            local t_max = 1
            local th = (t_min + t_max) * 0.5
            local x
            for j = 0, 12 do -- 8回程度で問題ない精度っぽい
                x = BezierX(th, pn[k][1], pn[k + 1][1], pn[k + 2][1], p3[1])
                if (t < x) then
                    t_max = th
                else
                    t_min = th
                end
                th = (t_min + t_max) * 0.5
            end
            Time[i] = BezierX(th, pn[k][2], pn[k + 1][2], pn[k + 2][2], p3[2])
        end

        return Time
    end
}
