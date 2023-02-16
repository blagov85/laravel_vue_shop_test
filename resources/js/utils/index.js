const utils = {
    percentRatingStar(rating){
        let percent = (rating / 5) * 100;
        return Math.round(percent);
    },
    percentDiscountProduct(newPrice, oldPrice){
        let percent = ((oldPrice - newPrice) / oldPrice) * 100;
        return Math.round(percent);
    },
    getProductDataToString(arrayObjectData){
        if (arrayObjectData !== null){
            let arrayData = [];
            arrayObjectData.forEach((el,i) => {
                arrayData[i] = el.title;
            });
            let stringData = arrayData.join();
            stringData = stringData.replaceAll(',', ', ');
        return stringData;
        }
        else{
            return '';
        }
    }
}
export default utils;