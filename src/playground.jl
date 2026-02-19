using KineticFunctions
#using Plots
const R = 8.31

testpath = raw"C:\\Users\\Kirill\\.julia\\dev\\KineticFunctions.jl\\assets\\";

test_names = ["fn_600_1_tg.txt", "fn_700_5_tg.txt", "fn_800_10_tg.txt", "fn_1000_20_tg.txt", "fn_1000_30_tg.txt"]

fn1 = tgdftodf(TGDataFrame(TGParser(testpath*test_names[1])));
fn5 = tgdftodf(TGDataFrame(TGParser(testpath*test_names[2])));
fn10 = tgdftodf(TGDataFrame(TGParser(testpath*test_names[3])));
fn20 = tgdftodf(TGDataFrame(TGParser(testpath*test_names[4])));
fn30 = tgdftodf(TGDataFrame(TGParser(testpath*test_names[5])));

